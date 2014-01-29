require './db/seeds/market_seeder'
require './db/seeds/product_seeder'

ProductSeeder.seed
MarketSeeder.seed(100)
