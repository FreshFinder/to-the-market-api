require 'spec_helper'

describe Market do
  describe "address association" do
    it "should have an address" do
      market = FactoryGirl.create(:market)
      address = FactoryGirl.create(:address, :market_id => market.id)
      expect(market.address.zipcode).to eq(44303)
    end
  end
end
