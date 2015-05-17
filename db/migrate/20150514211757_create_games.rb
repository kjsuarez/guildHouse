class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
