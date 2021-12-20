class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.integer :schedule_id, :null => false
      t.time :start_time, :null => false
      t.time :end_time, :null => false
      t.timestamps
    end
  end
end
