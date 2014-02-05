class Schedule < ActiveRecord::Base
  has_many :market_schedules
  has_many :markets, through: :market_schedules
end
