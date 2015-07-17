class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|

      t.timestamps null: false
    end    
  end
end
