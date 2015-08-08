class AddAssociationsToConditionCounters < ActiveRecord::Migration
  def change
  	add_reference :condition_counters, :character, index: true
    add_foreign_key :condition_counters, :character

  	add_reference :condition_counters, :monster_datum, index: true
    add_foreign_key :condition_counters, :monster_datum

  	add_reference :condition_counters, :combat_action, index: true
    add_foreign_key :condition_counters, :combat_action        
  end
end
