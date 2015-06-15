class AddForeignKeysToStatement < ActiveRecord::Migration
  def change
  	add_reference :statements, :character, index: true
    add_foreign_key :statements, :characters

    add_reference :statements, :game, index: true
    add_foreign_key :statements, :games
  end
end
