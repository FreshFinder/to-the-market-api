class Api::V1::PaymentTypesController < ApplicationController

  def index
    market = Market.includes(:payment_types).find(params[:market_id])
    render json: market.payment_types.map(&:name)
  end

end
