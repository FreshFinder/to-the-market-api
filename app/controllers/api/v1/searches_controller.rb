class Api::V1::SearchesController < ApplicationController

  def markets
    markets = Market.all
    render json: markets
  end

end
