json.seasons @open_times.seasons do |json, season|
  json.(season, :season_number, :start_month, :end_month)
  json.schedules season.schedules do |json, schedule|
    json.(schedule, :day, :start_time, :end_time)
  end
end
