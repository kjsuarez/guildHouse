class CreateEncounterOwnerships < ActiveRecord::Migration
  def change
    create_table :encounter_ownerships do |t|
    	t.belongs_to :encounter
    	t.belongs_to :monster
    	t.belongs_to :character	
    	t.timestamps null: false
    end
  end
end
