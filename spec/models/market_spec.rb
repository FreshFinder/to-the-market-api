require 'spec_helper'

describe Market do
  before :each do
    @market = FactoryGirl.create(:market)
    address = FactoryGirl.create(:address, :market_id => @market.id)
    product = FactoryGirl.create :product
    season = FactoryGirl.create :season
    schedule = FactoryGirl.create :schedule
    market_schedule = FactoryGirl.create :market_schedule, :market_id => @market.id, :season_id => season.id, :schedule_id => schedule.id
    FactoryGirl.create :offering, :market_id => @market.id, :product_id => product.id
  end

  describe "address association" do
    it "should have an address" do
      expect(@market.address.zipcode).to eq(44303)
    end
  end

  describe "with_addresses" do
    it "should return the address" do
      market_addresses = Market.with_addresses
      expect(market_addresses.first.address.class).to eq(Address)
    end
  end

  describe "offering association" do
    it "should have offerings for the given market" do
      expect(@market.products.first.name).to eq("honey")
    end
  end

  describe "market schedules association" do
    it "should have a schedule for a given market" do
      expect(@market.schedule.start_time).to eq("13:00:00")
      expect(@market.schedule.end_time).to eq("18:00:00")
    end
  end
end
