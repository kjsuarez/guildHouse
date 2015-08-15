class AddDiceToCharacterData < ActiveRecord::Migration
  def change
  	add_column :character_data, :dice, :integer
  end
end
