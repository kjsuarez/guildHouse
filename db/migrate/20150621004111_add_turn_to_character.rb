class AddTurnToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :dice, :integer
    add_index  :characters, :dice

	add_column :games, :turn, :integer
    add_index  :games, :turn    
  end
end
