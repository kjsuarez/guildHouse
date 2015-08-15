class AddAssociationsToCharacterData < ActiveRecord::Migration
  def change
  	add_reference :character_data, :character, index: true
    add_foreign_key :character_data, :character

  	add_reference :character_data, :encounter, index: true
    add_foreign_key :character_data, :encounter

	add_reference :condition_counters, :character_data, index: true
    add_foreign_key :condition_counters, :character_data              	
  end
end
