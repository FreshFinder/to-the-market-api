class Address < ActiveRecord::Base

  with_options :presence => true do |address|
    address.validates :market_id
  end

  belongs_to :market

  geocoded_by :address, :latitude => :lat, :longitude => :long

  reverse_geocoded_by :lat, :long

  def address
    [state, city, street, zipcode].join(" ")
  end
end
