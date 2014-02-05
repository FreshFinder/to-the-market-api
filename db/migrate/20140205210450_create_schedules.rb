class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :season_id
      t.integer :day
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
