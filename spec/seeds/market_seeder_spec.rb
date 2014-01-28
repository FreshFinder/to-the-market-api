require 'spec_helper'
require 'stringio'
require './db/seeds/market_seeder'

describe "Parsing a market" do
  it "parses a CSV into lines" do
    mp = MarketSeeder.parse_file('./spec/seeds/source/2013_faker_markets.csv')
    expect(mp.count).to eq 11
  end
end

describe "Seeding a market" do
  it "changes the count on the Market database when seeded" do
    out = StringIO.new
    expect(Market.count).to eq 0
    MarketSeeder.seed(2, out)
    expect(Market.count).to eq 2
  end

  it "changes the count on the Address database when seeded" do
    out = StringIO.new
    expect(Address.count).to eq 0
    MarketSeeder.seed(2, out)
    expect(Address.count).to eq 2
  end
end
