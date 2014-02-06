class Api::V1::SchedulesController < ApplicationController

  def index
    #schedules = market.seasons.first.schedules
    #seasons = market.seasons
    open_times = Market.where(id: params[:market_id]).includes(seasons: [:schedules]).as_json(include: :seasons)
    render json: open_times

  end

end

