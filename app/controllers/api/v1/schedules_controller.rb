class Api::V1::SchedulesController < ApplicationController

  def index
    market = Market.find(params[:market_id])
    schedules = market.schedules
    seasons = market.seasons
    market_schedule = market.market_schedules
    render json: market_schedule.map(&:season_id)
  end

end

