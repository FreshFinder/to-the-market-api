class Market < ActiveRecord::Base

  has_one :address

  def self.with_addresses
    Market.includes(:address).all
  end

end
