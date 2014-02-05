class Market < ActiveRecord::Base

  has_one :address
  has_many :products, through: :offerings
  has_many :offerings
  has_many :payment_types, through: :accepted_payments
  has_many :accepted_payments
  has_many :schedules, through: :market_schedules
  has_many :seasons, through: :market_schedules
  has_many :market_schedules

  def self.with_addresses
    Market.includes(:address)
  end

end
