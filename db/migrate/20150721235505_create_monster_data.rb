class CreateMonsterData < ActiveRecord::Migration
  def change
    create_table :monster_data do |t|
      t.integer :turns_left
      t.integer :onset_counter
	   t.belongs_to :monster_datum
	   t.belongs_to :character
     t.belongs_to :combat_action
      t.timestamps null: false
    end
  end
end
