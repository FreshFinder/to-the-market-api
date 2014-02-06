require 'spec_helper'

describe "Markets Show API" do
 describe 'GET /api/v1/markets/:market_id' do
    it 'returns all data associated with individual market' do
      market = FactoryGirl.create :market
      FactoryGirl.create :address, :market_id => market.id
      product = FactoryGirl.create :product
      offering = FactoryGirl.create(:offering, :market_id => market.id,
                                    :product_id => product.id)
      payment_type = FactoryGirl.create :payment_type
      accepted_payment = FactoryGirl.create(:accepted_payment,
                                            :market_id => market.id,
                                            :payment_type => payment_type)
      season = FactoryGirl.create(:season, :market_id => market.id)
      schedule = FactoryGirl.create(:schedule, :season_id => season.id)


      get "/api/v1/markets/#{market.id}", {}, {"Accept" => "application/json"}

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      parsed_market = body['market'][0]
      parsed_name = parsed_market['name']
      parsed_address = parsed_market['address']['street']
      parsed_payment_types = parsed_market['payment_types'][0]['name']
      parsed_products = parsed_market['products'][0]['name']

      expected_info = [{id: market.id, name: market.name, address: market.address, offering: market.offerings, accepted_payment: market.accepted_payments }]

      expect(market.name).to eq(parsed_name)
      expect(market.address.street).to eq(parsed_address)
      expect(market.payment_types.first.name).to eq(parsed_payment_types)
      expect(market.products.first.name).to eq(parsed_products)
    end
  end
end
