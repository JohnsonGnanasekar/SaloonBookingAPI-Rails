class CreateChairs < ActiveRecord::Migration[5.2]
  def change
    create_table :chairs do |t|
      t.integer :saloon_id, :null => false
      t.integer :saloon_chair_id, :null => false
      t.timestamps

      t.index [:saloon_id, :saloon_chair_id], unique: true
    end
  end
end
