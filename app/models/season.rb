class Season < ActiveRecord::Base
  belongs_to :market
  has_many :schedules
end
