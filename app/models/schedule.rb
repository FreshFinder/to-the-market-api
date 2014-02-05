class Schedule < ActiveRecord::Base
  has_many :seasons
  has_many :markets, through: :seasons
end
