class AddContentToCombatActions < ActiveRecord::Migration
  def change
  	add_column :combat_actions, :area, :string
  	add_column :combat_actions, :onset, :string
  	add_column :combat_actions, :saving_throw, :string
  	add_column :combat_actions, :frequency, :string
  	add_column :combat_actions, :cure, :integer
  end
end
