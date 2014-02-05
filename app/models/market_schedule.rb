class MarketSchedule < ActiveRecord::Base
  belongs_to :market
  belongs_to :season
  belongs_to :schedule
end
