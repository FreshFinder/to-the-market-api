class Api::V1::SchedulesController < ApplicationController

  def index
    @open_times = Market.where(id: params[:market_id]).with_open_times
  end

end

