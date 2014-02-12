class MarketSearchService < ActiveRecord::Base

  def self.by_zipcode(target_zipcode, radius = 30)
    market_ids = Address.near(target_zipcode.to_s, radius).select("id").map(&:market_id)
    markets = Market.includes(:address).where(:id => market_ids)
  end

end
