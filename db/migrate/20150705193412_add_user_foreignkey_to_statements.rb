class AddUserForeignkeyToStatements < ActiveRecord::Migration
  def change
    add_reference :statements, :user, index: true
    add_foreign_key :statements, :users  	
  end
end
