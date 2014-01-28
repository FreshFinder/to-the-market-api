require 'csv'

class MarketSeeder

  def self.seed(number = {}, out = STDOUT)
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
    Market.create!(:fmid => line[:fmid], :name => line[:marketname])
    out.puts line[:marketname]
  end
end
