class AddSavesRolledToCharacterDataAndMonsterData < ActiveRecord::Migration
  def change
  	add_column :character_data, :saves_rolled, :boolean
  	add_column :monster_data, :saves_rolled, :boolean
  end
end
