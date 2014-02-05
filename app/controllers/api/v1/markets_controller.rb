class Api::V1::MarketsController < ApplicationController

  def index
    if params[:address]
      markets = Market.with_addresses.as_json(:include => :address)
    else
      markets = Market.all
    end
    render json: markets
  end

  def show
    market = Market.where(id: params[:id]).includes(:address, :payment_types, :products).as_json(:include => [:address, :payment_types, :products])
    render json: market
  end
end
