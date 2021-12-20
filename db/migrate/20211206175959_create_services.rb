class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :saloon_id, :null => false
      t.string :name, :null => false
      t.integer :duration, :null => false
      t.decimal :cost, :null => false
      t.timestamps
    end
  end
end
