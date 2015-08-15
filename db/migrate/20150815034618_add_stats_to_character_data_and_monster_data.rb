class AddStatsToCharacterDataAndMonsterData < ActiveRecord::Migration
  def change
  	add_column :character_data, :strength, :integer
  	add_column :character_data, :dexterity, :integer
  	add_column :character_data, :constitution, :integer
  	add_column :character_data, :intelligence, :integer
  	add_column :character_data, :wisdom, :integer
  	add_column :character_data, :charisma, :integer

	add_column :monster_data, :strength, :integer
  	add_column :monster_data, :dexterity, :integer
  	add_column :monster_data, :constitution, :integer
  	add_column :monster_data, :intelligence, :integer
  	add_column :monster_data, :wisdom, :integer
  	add_column :monster_data, :charisma, :integer
  end
end
