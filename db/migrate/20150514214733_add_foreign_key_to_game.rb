class AddForeignKeyToGame < ActiveRecord::Migration
  def change
    add_reference :games, :character, index: true
    add_foreign_key :games, :characters

    add_reference :characters, :game, index: true
    add_foreign_key :characters, :games
  end
end
