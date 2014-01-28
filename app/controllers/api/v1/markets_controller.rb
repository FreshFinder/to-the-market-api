class Api::V1::MarketsController < ApplicationController

  def index
    if params[:address]
      markets = Market.with_addresses.as_json(:include => :address)
    else
      markets = Market.all
    end
    render json: markets
  end
end
