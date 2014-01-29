class Api::V1::ProductsController < ApplicationController

  def index
    market = Market.find(params[:market_id])
    products = market.products
    render json: products.map(&:name)
  end

end
