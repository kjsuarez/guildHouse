class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :description
      t.integer :cash_value
      t.string :weapon_type
      t.string :weapon_use
      t.string :hands
      t.string :size
      t.string :damage_type
      t.boolean :masterwork

      t.timestamps null: false
    end
  end
end
