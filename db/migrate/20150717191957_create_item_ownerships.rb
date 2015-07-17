class CreateItemOwnerships < ActiveRecord::Migration
  def change
    create_table :item_ownerships do |t|
      t.belongs_to :armor
      t.belongs_to :weapon
      t.belongs_to :user
      t.belongs_to :character
      t.belongs_to :game
      t.belongs_to :combat_action                  
      t.timestamps null: false
    end
  end
end
