json.seasons @open_times.seasons do |season|
  json.(season, :season_number, :start_month, :end_month)
  json.schedules season.schedules do |schedule|
    json.(schedule, :day, :start_time, :end_time)
  end
end
