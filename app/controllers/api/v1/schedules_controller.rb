class Api::V1::SchedulesController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::ImplicitRender


  def index
    @open_times = Market.where(id: params[:market_id]).with_open_times
  end

end

