class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :season_number
      t.string :start_month
      t.string :end_month

      t.timestamps
    end
  end
end
