class CreateSaloons < ActiveRecord::Migration[5.2]
  def change
    create_table :saloons do |t|
      t.string :name, :null => false
      t.string :gstin
      t.string :pan
      t.string :address, :null => false
      t.timestamps
    end
  end
end
