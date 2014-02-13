class AddIndexesToFKs < ActiveRecord::Migration
  def change
    add_index :accepted_payments, :market_id
    add_index :accepted_payments, :payment_type_id

    add_index :addresses, :lat
    add_index :addresses, :long

    add_index :offerings, :market_id
    add_index :offerings, :product_id

    add_index :schedules, :season_id

    add_index :seasons, :market_id
  end
end
