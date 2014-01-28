require 'spec_helper'

describe Market do
  before :each do
    @market = FactoryGirl.create(:market)
    address = FactoryGirl.create(:address, :market_id => @market.id)
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
end
