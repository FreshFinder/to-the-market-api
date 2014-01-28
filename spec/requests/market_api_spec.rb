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
end
