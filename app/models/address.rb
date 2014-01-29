class Address < ActiveRecord::Base
  with_options :presence => true do |address|
    address.validates :market_id
  end

  belongs_to :market
end
