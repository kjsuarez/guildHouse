class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.integer :cr
      t.integer :xp
      t.integer :init_mod
      t.integer :ac
      t.integer :hp
      t.integer :fort_save
      t.integer :ref_save
      t.integer :strength 
      t.integer :will_save
      t.string :dexterity
      t.string :constitution
      t.string :intelligence
      t.string :wisdom
      t.string :charisma

      t.timestamps null: false
    end
  end
end
