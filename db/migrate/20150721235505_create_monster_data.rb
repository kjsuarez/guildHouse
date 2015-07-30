class CreateMonsterData < ActiveRecord::Migration
  def change
    create_table :monster_data do |t|
      t.integer :current_hp
      t.boolean :bleeding
      t.string :status
      t.boolean :grappled
	  t.belongs_to :monster
	  t.belongs_to :encounter

      t.timestamps null: false
    end
  end
end
