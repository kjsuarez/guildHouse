class AddTurnToEncounters < ActiveRecord::Migration
  def change  	
  	add_column :encounters, :turn, :integer
  end
end
