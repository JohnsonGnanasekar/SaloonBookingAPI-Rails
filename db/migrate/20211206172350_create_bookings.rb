class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :saloon_id, :null => false
      t.integer :chair_id, :null => false
      t.integer :service_id, :null => false
      t.date :date, :null => false
      t.time :start_time, :null => false
      t.time :end_time, :null => false
      t.decimal :cost, :null => false
      t.timestamps
    end
  end
end
