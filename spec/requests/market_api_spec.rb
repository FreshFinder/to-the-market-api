require 'spec_helper'

describe "Markets API" do
  describe "GET /api/v1/markets" do
    it "returns all the markets" do
      market = FactoryGirl.create :market
      FactoryGirl.create :address, :market_id => market.id

      get "/api/v1/markets", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      market_names = body.map {|market| market["name"]}
      market_keys = body.first.keys.include?("address")

      expect(market_names).to match_array(["The Fictional Market"])
      expect(market_keys).to be_false
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

  describe 'GET /api/v1/markets/:market_id' do
    it 'returns all data associated with individual market' do
      market = FactoryGirl.create :market
      FactoryGirl.create :address, :market_id => market.id
      product = FactoryGirl.create :product
      offering = FactoryGirl.create :offering, :market_id => market.id, :product_id => product.id
      payment_type = FactoryGirl.create :payment_type
      accepted_payment = FactoryGirl.create :accepted_payment,
                                            :market_id => market.id, :payment_type => payment_type
      get "/api/v1/markets/#{market.id}", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      parsed_name = body[0]['name']
      parsed_address = body[0]['address']['street']
      parsed_payment_types = body[0]['payment_types'][0]['name']
      parsed_products = body[0]['products'][0]['name']

      expected_info = [{id: market.id, name: market.name, address: market.address, offering: market.offerings, accepted_payment: market.accepted_payments }]

      expect(market.name).to eq(parsed_name)
      expect(market.address.street).to eq(parsed_address)
      expect(market.payment_types.first.name).to eq(parsed_payment_types)
      expect(market.products.first.name).to eq(parsed_products)
    end
  end

  describe "GET /api/v1/markets/:market_id/products" do
    it "returns products for the given market" do
      market = FactoryGirl.create :market
      product = FactoryGirl.create :product
      offering = FactoryGirl.create :offering, :market_id => market.id, :product_id => product.id

      get "/api/v1/markets/#{market.id}/products", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      market_products = body.map { |product| product}
      expect(market_products).to match_array(["honey"])
    end
  end

  describe "GET /api/v1/markets/:market_id/payment_types" do
    it "returns accepted payment types for the given market" do
      market = FactoryGirl.create :market
      payment_type = FactoryGirl.create :payment_type
      accepted_payment = FactoryGirl.create :accepted_payment,
                                            :market_id => market.id, :payment_type => payment_type

      get "/api/v1/markets/#{market.id}/payment_types", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      market_payment_types = body.map { |payment_type| payment_type }
      expect(market_payment_types).to match_array(["credit"])
    end
  end

  describe "GET /api/v1/markets/:market_id/schedules" do
    it "returns schedule information for the given market" do
      market = FactoryGirl.create :market
      season = FactoryGirl.create :season
      schedule = FactoryGirl.create :schedule
      market_schedule = FactoryGirl.create :market_schedule, :market_id => market.id, :season_id => season.id, :schedule_id => schedule.id

      get "/api/v1/markets/#{market.id}/schedules", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expected_schedule = body.map { |schedule| schedule }
      expect(expected_schedule).to match_array([])
    end
  end

end
