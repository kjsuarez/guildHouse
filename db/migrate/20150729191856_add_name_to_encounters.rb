class AddNameToEncounters < ActiveRecord::Migration
  def change
  	add_column :encounters, :name, :string
  end
end
