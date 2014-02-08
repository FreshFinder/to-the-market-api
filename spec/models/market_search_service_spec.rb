require 'spec_helper'

describe MarketSearchService do
  # :TODO: mock out the response
  before :each do
    denver_market = FactoryGirl.create :market, :name => "Denver Hipster Hoodlum"
    florida_market = FactoryGirl.create :market, :name => "Boca Bacon Bathers"

    FactoryGirl.create :address, :market_id => denver_market.id,
                                 :zipcode => 80218,
                                 :lat => 39.7392,
                                 :long => -104.9847

    FactoryGirl.create :address, :market_id => florida_market.id,
                                 :zipcode => 33431,
                                 :lat => 26.3686,
                                 :long => -80.1000
  end

  describe "by zipcode" do
    it "returns markets by zipcode" do
      markets = MarketSearchService.by_zipcode(80218)
      expect(markets.map(&:name)).to match_array(["Denver Hipster Hoodlum"])
    end
  end
end
