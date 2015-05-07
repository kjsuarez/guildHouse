class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :strength
      t.string :dexterity
      t.string :constitution
      t.string :intelligence
      t.string :wisdom
      t.string :charisma

      t.timestamps null: false
    end
  end
end
