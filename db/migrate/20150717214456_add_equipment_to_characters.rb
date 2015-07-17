class AddEquipmentToCharacters < ActiveRecord::Migration
  def change
  	add_column :characters, :equipment, :string
  end
end
