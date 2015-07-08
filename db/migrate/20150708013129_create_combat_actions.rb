class CreateCombatActions < ActiveRecord::Migration
  def change
    create_table :combat_actions do |t|
      t.string :name
      t.integer :damage
      t.string :effects
      t.string :buffs
      t.string :immunities

      t.timestamps null: false
    end
  end
end
