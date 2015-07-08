class AddNameToMonsters < ActiveRecord::Migration
  def change
  	add_column :monsters, :name, :string
  	add_column :monsters, :flavor_text, :string
  end
end
