class AddContentToConditionCounters < ActiveRecord::Migration
  def change
  	add_column :condition_counters, :turns_left, :integer
  	add_column :condition_counters, :onset_counter, :integer
  	add_column :condition_counters, :frequency_counter, :integer
  end
end
