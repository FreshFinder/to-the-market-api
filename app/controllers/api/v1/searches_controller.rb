class Api::V1::SearchesController < ApplicationController

  def markets
    markets = Market.all
    markets = Market.search_by_zipcode(params[:zipode])
    render json: markets
  end

end
