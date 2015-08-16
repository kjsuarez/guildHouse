class AddAssociationsToCharacterData < ActiveRecord::Migration
  def change
  	add_reference :character_data, :character, index: true
    add_foreign_key :character_data, :character

  	add_reference :character_data, :encounter, index: true
    add_foreign_key :character_data, :encounter

	add_reference :character_data, :condition_counters, index: true
    add_foreign_key :character_data, :condition_counters              	
  end
end
