class CreateSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :sectors do |t|
      t.string :name, null: false
      t.integer :parent_id, null: true
      t.timestamps
    end
    add_index :sectors, [:name, :parent_id], unique: true
  end
end
