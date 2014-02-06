json.seasons do |json|
  json.(@open_times.seasons.first, :season_number)
end

json.seasons @open_times.seasons, :season_number
