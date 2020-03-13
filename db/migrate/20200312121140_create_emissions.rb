class CreateEmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :emissions do |t|
      t.integer :year, null: false
      t.float :value, null: false
      t.belongs_to :country
      t.belongs_to :sector

      t.timestamps
    end
  end
end
