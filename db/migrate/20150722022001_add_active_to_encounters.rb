class AddActiveToEncounters < ActiveRecord::Migration
  def change
  	add_column :encounters, :active, :boolean  	
  end
end
