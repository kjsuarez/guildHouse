class AddStatementToGame < ActiveRecord::Migration
  def change
  	add_column :games, :statement, :string
  end
end
