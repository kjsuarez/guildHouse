class AddClassToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :character_class, :string
  end
end
