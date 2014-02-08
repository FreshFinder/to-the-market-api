class Market < ActiveRecord::Base

  has_one :address
  has_many :products, through: :offerings
  has_many :offerings
  has_many :payment_types, through: :accepted_payments
  has_many :accepted_payments
  has_many :seasons

  def self.with_addresses
    Market.includes(:address)
  end

  def self.with_open_times
    Market.includes(seasons: [:schedules]).first
  end

  def self.search_by_zipcode(target_zipcode)
    MarketSearchService.by_zipcode(target_zipcode)
  end

end
