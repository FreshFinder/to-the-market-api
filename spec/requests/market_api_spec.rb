require 'spec_helper'

describe "Markets API" do
  describe "GET /api/v1/markets" do
    it "returns all the markets" do
      FactoryGirl.create :market

      get "/api/v1/markets", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      market_names = body.map {|market| market["name"]}

      expect(market_names).to match_array(["The Fictional Market"])
    end
  end

  describe "GET /api/v1/markets?address=true" do
    it "returns addresses for all the markets" do
      market = FactoryGirl.create :market
      FactoryGirl.create :address, :market_id => market.id

      get "/api/v1/markets?address=true", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      market_address = body.map { |market| market["address"]["lat"]}
      expect(market_address).to match_array(["41.073104"])
    end
  end

end
