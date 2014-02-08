class ScheduleSeeder

  def self.build_schedules(season_id, unparsed_schedule, out)
    schedules = convert_season_times(unparsed_schedule)
    unless schedules.nil?
      s = schedules.map do |schedule|
        Schedule.create!(:season_id => season_id,
                         :day => schedule[0],
                         :start_time => schedule[1][0],
                         :end_time => schedule[1][1])
      end
    end
    out.puts "Building schedule for season #{season_id}"
  end

  def self.convert_season_times(line)
    unless line.nil?
      parsed_hash = Hash.new
      day_splitter(line).map do |day_time|
        found_day = day_of_week_finder(day_time)
        found_times = time_of_day_finder(day_time)
        split_times = start_end_time_splitter(found_times)
        converted_times = split_times.map do |time|
          military_time_converter(time)
        end
        parsed_hash[found_day] = converted_times
      end
      parsed_hash
    end
  end

  def self.day_splitter(input)
    input.split(";")
  end

  def self.day_of_week_finder(input)
    day = input[0..2].capitalize
    case day
      when "Sun" then 0
      when "Mon" then 1
      when "Tue" then 2
      when "Wed" then 3
      when "Thu" then 4
      when "Fri" then 5
      when "Sat" then 6
    end
  end

  def self.start_end_time_splitter(input)
    input.gsub(" ", "").split("-")
  end

  def self.time_of_day_finder(input)
    input[4..-1]
  end

  def self.military_time_converter(input)
    begin
      Time.parse(input).hour.to_s + ":00:00"
    rescue ArgumentError
      nil
    end
  end
end
