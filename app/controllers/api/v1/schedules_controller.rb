class Api::V1::SchedulesController < ApplicationController

  def index
    @open_times = Market.where(id: params[:market_id]).includes(seasons: [:schedules]).first
  end

end

