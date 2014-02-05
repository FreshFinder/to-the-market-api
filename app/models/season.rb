class Season < ActiveRecord::Base
  belongs_to :market
  belongs_to :schedule
end
