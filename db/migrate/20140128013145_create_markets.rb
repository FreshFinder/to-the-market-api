class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :fmid
      t.string :name

      t.timestamps
    end
  end
end
