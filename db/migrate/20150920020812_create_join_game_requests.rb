class CreateJoinGameRequests < ActiveRecord::Migration
  def change
    create_table :join_game_requests do |t|
      t.integer :player_id
      t.integer :master_id
      t.integer :character_id
      t.integer :game_id
      t.boolean :answer

      t.timestamps null: false
    end
    add_index :join_game_requests, :master_id
  end
end
