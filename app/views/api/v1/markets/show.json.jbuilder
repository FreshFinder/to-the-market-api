json.market do |json|
  json.(@market, :name)
  json.address @market.address, :street, :city, :state, :zipcode, :lat, :long, :description

  json.seasons @market.seasons do |json, season|
    json.(season, :season_number, :start_month, :end_month)
    json.schedules season.schedules do |json, schedule|
      json.(schedule, :day, :start_time, :end_time)
    end
  end

  json.products @market.products, :name
  json.payment_types @market.payment_types, :name

end

