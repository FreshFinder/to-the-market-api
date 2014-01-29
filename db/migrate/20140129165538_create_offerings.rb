class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :market_id
      t.integer :product_id
    end
  end
end
