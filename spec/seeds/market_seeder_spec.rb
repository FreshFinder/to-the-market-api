require 'spec_helper'
require 'stringio'
require './db/seeds/market_seeder'
require './db/seeds/product_seeder'

describe "Parsing a market" do
  it "parses a CSV into lines" do
    mp = MarketSeeder.parse_file('./spec/seeds/source/2013_faker_markets.csv')
    expect(mp.count).to eq 11
  end
end

describe "Seeding a market" do
  before :each do
    @out = StringIO.new
    ProductSeeder.seed
  end

  it "changes the count on the Market database when seeded" do
    expect(Market.count).to eq 0
    expect { MarketSeeder.seed(2, @out) }.to change{Market.count}.by 2
  end

  it "changes the count on the Address database when seeded" do
    expect(Address.count).to eq 0
    expect { MarketSeeder.seed(2, @out)}.to change{Address.count}.by 2
  end

  it "associates Products with their corresponding Markets when seeded" do
    MarketSeeder.seed(2, @out)
    m = Market.find_by(name: "10:10 Farmers Market")
    expect(m.products.count).to eq 10
  end
end

