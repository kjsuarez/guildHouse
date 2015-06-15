class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
