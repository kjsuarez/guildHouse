class CreateArmors < ActiveRecord::Migration
  def change
    create_table :armors do |t|
      t.string :name
      t.string :description
      t.integer :cash_value
      t.boolean :shield
      t.integer :armor_bonus
      t.integer :max_dex_bonus
      t.integer :armor_penalty
      t.integer :spell_failure
      t.boolean :masterwork

      t.timestamps null: false
    end
  end
end
