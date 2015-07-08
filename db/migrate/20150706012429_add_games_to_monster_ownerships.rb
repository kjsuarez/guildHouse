class AddGamesToMonsterOwnerships < ActiveRecord::Migration
  def change
    add_reference :monster_ownerships, :game, index: true
    add_foreign_key :monster_ownerships, :games     
  end
end
