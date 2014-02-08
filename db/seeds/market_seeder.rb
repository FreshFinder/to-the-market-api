require 'csv'
require_relative './address_seeder'
require_relative './season_seeder'
require_relative './schedule_seeder'

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

    s1 = SeasonSeeder.build_season(m.id, 1, line[:season1date], out)
    s2 = SeasonSeeder.build_season(m.id, 2, line[:season2date], out)
    s3 = SeasonSeeder.build_season(m.id, 3, line[:season3date], out)
    s4 = SeasonSeeder.build_season(m.id, 4, line[:season4date], out)


    ScheduleSeeder.build_schedules(s1.id, line[:season1time], out)
    ScheduleSeeder.build_schedules(s2.id, line[:season2time], out)
    ScheduleSeeder.build_schedules(s3.id, line[:season3time], out)
    ScheduleSeeder.build_schedules(s4.id, line[:season4time], out)

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

end
