class AddContentToCombatActions < ActiveRecord::Migration
  def change
  	add_column :combat_actions, :area, :string
  	add_column :combat_actions, :onset, :integer
  	add_column :combat_actions, :saving_throw, :string
  	add_column :combat_actions, :saving_value, :integer
  	add_column :combat_actions, :frequency, :integer
  	add_column :combat_actions, :limit, :integer
  	add_column :combat_actions, :cure, :integer
  end
end
