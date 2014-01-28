class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :market_id
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :long, {:precision=>10, :scale=>6}
      t.string :description

      t.timestamps
    end

    add_index :addresses, :market_id
  end
end
