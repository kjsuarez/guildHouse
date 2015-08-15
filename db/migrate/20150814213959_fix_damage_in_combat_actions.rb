class FixDamageInCombatActions < ActiveRecord::Migration
  def up
    change_column :combat_actions, :damage, :string
  end

  def down
    change_column :combat_actions, :damage, :integer
  end
end
