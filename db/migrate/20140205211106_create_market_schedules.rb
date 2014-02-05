class CreateMarketSchedules < ActiveRecord::Migration
  def change
    create_table :market_schedules do |t|
      t.integer :market_id
      t.integer :season_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
