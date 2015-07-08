class CreateActionOwnerships < ActiveRecord::Migration
  def change
    create_table :action_ownerships do |t|
    	t.belongs_to :monster
    	t.belongs_to :character	
    	t.belongs_to :combat_action
    	t.timestamps null: false
    end
  end
end
