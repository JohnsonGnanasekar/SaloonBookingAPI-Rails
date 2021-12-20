class CreateBookingSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_slots do |t|
      t.integer :booking_id, :null => false
      t.integer :schedule_slot_id, :null => false
      t.timestamps
    end
  end
end
