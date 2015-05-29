class AddGameMasterIdToGame < ActiveRecord::Migration
  def change
  	add_column :games, :gamemaster_id, :integer
  end
end
