class Address < ActiveRecord::Base
  with_options :presence => true do |address|
    address.validates :market_id
    address.validates :lat
    address.validates :long
  end

  belongs_to :market
end
