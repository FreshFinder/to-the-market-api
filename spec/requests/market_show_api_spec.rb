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

      parsed_market = body['market']
      parsed_name = parsed_market['name']
      parsed_address = parsed_market['address']['street']
      parsed_payment_types = parsed_market['payment_types'][0]
      parsed_products = parsed_market['products'][0]

      expect(parsed_name).to eq(market.name)
      expect(parsed_address).to eq(market.address.street)
      expect(parsed_payment_types).to eq(market.payment_types.first.name)
      expect(parsed_products).to eq(market.products.first.name)
    end
  end
end
