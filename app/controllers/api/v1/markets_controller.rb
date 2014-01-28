class Api::V1::MarketsController < ApplicationController

  def index
    markets = Market.includes(:address).all.as_json(:include => :address)
    render json: markets
  end
end
