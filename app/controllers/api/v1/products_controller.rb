class Api::V1::ProductsController < ApplicationController

  def index
    products = Product.where(market_id: params[:market_id]).pluck(:name)
    render json: products
  end

end
