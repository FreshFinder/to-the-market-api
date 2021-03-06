require 'spec_helper'

describe Market do
  before :each do
    @market = FactoryGirl.create(:market)
    address = FactoryGirl.create(:address, :market_id => @market.id)
    product = FactoryGirl.create :product
    payment_type = FactoryGirl.create :payment_type
    season = FactoryGirl.create :season, :market_id => @market.id
    schedule = FactoryGirl.create :schedule, :season_id => season.id
    FactoryGirl.create :offering, :market_id => @market.id, :product_id => product.id
    FactoryGirl.create :accepted_payment, :market_id => @market.id, :payment_type_id => payment_type.id
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

  describe "with_open_times" do
    it "should return open times for the given market" do
      market_hours = Market.with_open_times
      expect(market_hours.seasons.first.schedules.first.start_time).to eq("13:00:00")
      expect(market_hours.seasons.first.schedules.first.end_time).to eq("18:00:00")
    end

    it "should return a season for the given market" do
      market_hours = Market.with_open_times
      expect(market_hours.seasons.first.season_number).to eq(1)
    end
  end

  describe "offering association" do
    it "should have offerings for the given market" do
      expect(@market.products.first.name).to eq("honey")
    end
  end

  describe "accepted payment association" do
    it "should have accepted payment types for the given market" do
      expect(@market.payment_types.first.name).to eq("credit")
    end
  end

  describe "market schedules association" do
    it "should have a schedule for a given market" do
      expect(@market.seasons.first.schedules.first.start_time).to eq("13:00:00")
      expect(@market.seasons.first.schedules.first.end_time).to eq("18:00:00")
    end

    it "should have a season for a given market" do
      expect(@market.seasons.first.start_month).to eq("January")
      expect(@market.seasons.first.end_month).to eq("July")
    end
  end
end
