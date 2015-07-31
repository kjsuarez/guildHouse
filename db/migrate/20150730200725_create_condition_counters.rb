class CreateConditionCounters < ActiveRecord::Migration
  def change
    create_table :condition_counters do |t|

      t.timestamps null: false
    end
  end
end
