require 'csv'

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
    m = Market.create!(:fmid => line[:fmid], :name => line[:marketname])
    out.puts line[:marketname]
    a = Address.create!(:market_id => m.id,
                 :street => line[:street],
                 :city => line[:city],
                 :state => line[:state],
                 :zipcode => line[:zip],
                 :description => line[:location],
                 :long => line[:x],
                 :lat => line[:y])
    out.puts a.city

    product_list.each do |offering|
      if line[offering] == "Y"
        #m.offerings << Offering.new(:product_id => offerings_id_map[offering])
        m.products << Product.find_by(:name => offering.to_s.capitalize)
      end
    end

    if line[:bakedgoods] == "Y"
      m.products << Product.find_by(:name => "Baked Goods")
    end

  end

  def self.product_list
    [:cheese, :crafts, :flowers, :eggs, :seafood, :herbs, :vegetables, :honey, :jams, :maple, :meat, :nursery, :nuts, :poultry, :prepared, :soap, :trees, :wine]
  end

 end
