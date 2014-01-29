class Market < ActiveRecord::Base

  has_one :address
  has_many :products, through: :offerings
  has_many :offerings

  def self.with_addresses
    Market.includes(:address).all
  end

end
