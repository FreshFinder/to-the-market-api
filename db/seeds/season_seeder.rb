class SeasonSeeder

  def self.build_season(market_id, season_number, season_dates, out)
    start_month, end_month = convert_season_months(season_dates)
    Season.create!(:market_id => market_id,
                   :season_number => season_number,
                   :start_month => start_month,
                   :end_month => end_month)
    out.puts "Season created for market #{market_id} created!"
  end

  def self.convert_season_months(season_date)
    unless season_date.nil?
      if season_date.include?("/")
        parsed_months = parse_date_range(season_date)
      else
        parsed_months = season_date
      end
      parsed_months.split(" to ")
    end
  end

  def self.season_date_splitter(date_range)
    dates = date_range.gsub("/", "-").gsub(" ", "").split("to")
    dates.map {|date| month_to_name(date)}
  end

  def self.month_to_name(date)
    Date.strptime(date, '%m-%d-%Y').strftime("%B")
  end

  def self.parse_date_range(date_range)
    season_date_splitter(date_range).join(" to ")
  end

end
