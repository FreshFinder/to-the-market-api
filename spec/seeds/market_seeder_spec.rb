require 'spec_helper'
require 'stringio'
require './db/seeds/market_seeder'
require './db/seeds/product_seeder'
require './db/seeds/payment_type_seeder'
require './db/seeds/address_seeder'
require './db/seeds/season_seeder'
require './db/seeds/schedule_seeder'

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
    PaymentTypeSeeder.seed
  end

  it "changes the count on the Market database when seeded" do
    expect(Market.count).to eq 0
    expect { MarketSeeder.seed(2, @out) }.to change { Market.count }.by 2
  end

  it "changes the count on the Address database when seeded" do
    expect(Address.count).to eq 0
    expect { MarketSeeder.seed(2, @out) }.to change { Address.count }.by 2
  end

  it "associates Products with their corresponding Markets when seeded" do
    MarketSeeder.seed(2, @out)
    m = Market.find_by(name: "10:10 Farmers Market")
    expect(m.products.count).to eq 10
  end

  describe 'validations' do
    context 'market name' do
      it 'is valid with numbers and letters' do
        name = MarketSeeder.clean_market("\"Y Not Farmers Market\"")
        name2 = MarketSeeder.clean_market("100 Mile Market")
        result = Market.create(:fmid => 32, :name => name)
        result2 =  Market.create(:fmid => 35, :name => name2)
        expect(result.name).to eq "Y Not Farmers Market"
        expect(result2.name).to eq "100 Mile Market"
      end
    end

    context 'market street' do
      it 'is valid with numbers and letters' do
        street_name = AddressSeeder.clean_street("115 Market St,")
        result = Address.create(street: street_name)
        expect(result.street).to eq "115 Market St"
      end
    end
  end

  describe 'seeding a market with schedules' do
    it 'parses the season' do
      months_gregorian = SeasonSeeder.convert_season_months("11/02/03 to 01/02/04")
      months_as_words = SeasonSeeder.convert_season_months("November to February")
      expect(months_gregorian).to eq(["November", "January"])
      expect(months_as_words).to eq(["November", "February"])
    end

    it "changes the count in the database upon seeding a season" do
      out = StringIO.new
      expect { MarketSeeder.seed(2, out) }.to change { Season.count }.by 8
    end

    it "parses the schedule" do
      week = "Mon:12:00 PM - 5:00 PM;Tue:12:00 PM - 5:00 PM;Wed:12:00 PM - 5:00 PM;Thu:12:00 PM - 5:00 PM;Fri:12:00 PM - 5:00 PM;Sat:10:00 AM - 5:00 PM;sun:12:00 PM - 5:00 PM;"
      weekend = "Sat: 8:00 AM-3:00 PM;Sun: 8:00 AM-3:00 PM;"
      parsed_week = {1=>["12:00:00", "17:00:00"], 2=> ["12:00:00", "17:00:00"], 3=> ["12:00:00", "17:00:00"], 4=> ["12:00:00" ,"17:00:00"], 5=> ["12:00:00", "17:00:00"], 6=> ["10:00:00" , "17:00:00"], 0=> ["12:00:00", "17:00:00"]}

      expect(ScheduleSeeder.convert_season_times(week)).to eq(parsed_week)
    end

    it "changes the count in the database upon seeding a schedule" do
      out = StringIO.new
      expect { MarketSeeder.seed(2, out) }.to change { Schedule.count }.by 2
    end
  end
end
