class Api::V1::PaymentTypesController < ApplicationController

  def index
    market = Market.find(params[:market_id])
    payment_types = market.payment_types
    render json: payment_types.map(&:name)
  end

end
