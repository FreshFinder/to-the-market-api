class MarketSearchService < ActiveRecord::Base

  def self.by_zipcode(target_zipcode, radius = 30)
    Address.near(target_zipcode.to_s, radius).map(&:market)
  end

end
