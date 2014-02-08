class Api::V1::SearchesController < ApplicationController

  def markets
    markets = Market.all
    markets = Market.search_by_zipcode(params[:zipcode])
    render json: markets
  end

end
