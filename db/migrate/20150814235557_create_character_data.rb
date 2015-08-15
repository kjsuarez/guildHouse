class CreateCharacterData < ActiveRecord::Migration
  def change
    create_table :character_data do |t|
      t.integer :current_hp

      t.timestamps null: false
    end
  end
end
