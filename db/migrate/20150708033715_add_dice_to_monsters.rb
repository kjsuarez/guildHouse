class AddDiceToMonsters < ActiveRecord::Migration
  def change
  	add_column :monsters, :dice, :integer
  end
end
