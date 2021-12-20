class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :saloon_id, :null => false
      t.integer :week_day, :null => false
      t.time :open_time, :null => false
      t.time :close_time, :null => false
      t.timestamps

      t.index [:saloon_id, :week_day], unique: true
    end
  end
end
