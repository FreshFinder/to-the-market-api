class AddressSeeder

  def self.build_address(market_id, street, city, state, zipcode, description, long, lat, out)
    a = Address.create(:market_id => market_id,
                   :street => clean_street(street),
                   :city => city,
                   :state => state,
                   :description => description,
                   :long => long,
                   :lat => lat)
    out.puts a.city
  end

  def self.clean_street(line)
    line.gsub(/,/, "") unless line.nil?
  end

end
