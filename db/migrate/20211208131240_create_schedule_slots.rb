class CreateScheduleSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_slots do |t|
      t.integer :schedule_id, :null => false
      t.integer :slot_id, :null => false
      t.integer :chair_id, :null => false
      t.integer :book_status, :null => false, default: 0
      t.timestamps
    end
  end
end
