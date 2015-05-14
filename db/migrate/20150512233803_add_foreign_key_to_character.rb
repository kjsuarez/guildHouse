class AddForeignKeyToCharacter < ActiveRecord::Migration
  def change
    add_reference :characters, :user, index: true
    add_foreign_key :characters, :users
  end
end
