class AddDiceToMonsterData < ActiveRecord::Migration
  def change
  	add_column :monster_data, :dice, :integer  	
  end
end
