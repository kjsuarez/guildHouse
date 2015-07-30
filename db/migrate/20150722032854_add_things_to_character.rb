class AddThingsToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :name, :string
  	add_column :characters, :status, :string
  	add_column :characters, :bleeding, :boolean
  	add_column :characters, :grappled, :boolean
  	add_column :characters, :current_hp, :integer   	
  end
end
