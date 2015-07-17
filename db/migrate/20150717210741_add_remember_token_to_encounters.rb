class AddRememberTokenToEncounters < ActiveRecord::Migration
  def change
  	add_reference :encounters, :game, index: true
    add_foreign_key :encounters, :game
  end
end
