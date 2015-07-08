class CreateMonsterOwnerships < ActiveRecord::Migration
  def change
    create_table :monster_ownerships do |t|
      t.belongs_to :monster
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
