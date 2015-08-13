class FixSaveProblemInCombatActions < ActiveRecord::Migration
  def up
    remove_column :combat_actions, :save
  end

  def down
    add_column :combat_actions, :save, :string
  end
end
