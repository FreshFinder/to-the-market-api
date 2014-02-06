json.market do
  json.(@market, :name)
  json.address @market.address, :street, :city, :state, :zipcode, :lat, :long, :description

  json.seasons @market.seasons do |season|
    json.(season, :season_number, :start_month, :end_month)
    json.schedules season.schedules do |schedule|
      json.(schedule, :day, :start_time, :end_time)
    end
  end

  json.products @market.products, :name

  json.products do
    json.array! @market.products.map(&:name)
  end

  json.payment_types do
    json.array! @market.payment_types.map(&:name)
  end

end

