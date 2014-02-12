class Api::V1::SearchesController < ApplicationController

  def markets
    markets = Market.search_by_zipcode(params[:zipcode]).as_json(:include => :address)
    render json: markets
  end

end
