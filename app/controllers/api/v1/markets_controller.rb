class Api::V1::MarketsController < ApplicationController

  def index
    if params[:address] == "true"
      markets = Market.with_addresses.as_json(:include => :address)
    else
      markets = Market.all
    end
    render json: markets
  end

  def show
    # method on market model for the includes
    @market = Market.where(id: params[:id]).includes(:address, :payment_types, :products).first
  end
end
