require './db/seeds/market_seeder'
require './db/seeds/product_seeder'
require './db/seeds/payment_type_seeder'

ProductSeeder.seed
PaymentTypeSeeder.seed
MarketSeeder.seed
