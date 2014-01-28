class Api::V1::MarketsController < ApplicationController

  def index
    if params[:address]
      markets = Market.includes(:address).all.as_json(:include => :address)
    else
      markets = Market.all
    end
    render json: markets
  end
end
