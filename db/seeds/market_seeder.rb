require 'csv'
require_relative './address_seeder'

class MarketSeeder

  def self.seed(number = nil, out = STDOUT)
    data = MarketSeeder.parse_file('./db/seeds/source/2013_farmers_markets.csv')
    if number
      data.to_a[0...number].collect {|line| build_markets(line, out)}
    else
      data.collect {|line| build_markets(line, out)}
    end
  end

  def self.parse_file(filename)
    open_file(filename)
  end

  def self.open_file(filename)
    CSV.open(filename, :headers => true, :header_converters => :symbol)
  end

  def self.build_markets(line, out)
    m = Market.create!(:fmid => line[:fmid], :name => clean_market(line[:marketname]))
    out.puts line[:marketname]
    AddressSeeder.build_address(m.id, line[:street], line[:city],
                                line[:state], line[:zip],
                                line[:location], line[:x], line[:y], out)

    product_list.each do |offering|
      if line[offering] == "Y"
        m.products << Product.find_by(:name => offering.to_s.capitalize)
      end
    end

    if line[:bakedgoods] == "Y"
      m.products << Product.find_by(:name => "Baked Goods")
    end

    payment_type_list.each do |accepted_payment|
      if line[accepted_payment] == "Y"
        m.payment_types << PaymentType.find_by(:name => accepted_payment.to_s)
      end
    end

    s1_start_month, s1_end_month = convert_season_months(line[:season1date])

    season1 = Season.create!(:market_id => m.id,
                            :season_number => 1,
                            :start_month => s1_start_month,
                            :end_month => s1_end_month)


  end

  def self.product_list
    [:cheese, :crafts, :flowers, :eggs, :seafood, :herbs, :vegetables, :honey, :jams, :maple, :meat, :nursery, :nuts, :poultry, :prepared, :soap, :trees, :wine]
  end

  def self.payment_type_list
    [:credit, :wic, :wiccash, :sfmnp, :snap]
  end

  def self.clean_market(line)
    line.gsub(/"/, "") unless line.nil?
  end

  def self.convert_season_months(season_date)
    unless season_date.nil?
      if season_date.include?("/")
        parsed_months = parse_date_range(season_date)
      else
        parsed_months = season_date
      end
    end
    parsed_months.split(" to ")
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
