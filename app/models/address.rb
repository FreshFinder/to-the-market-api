class Address < ActiveRecord::Base
  validates :market_id, presence: true
end
