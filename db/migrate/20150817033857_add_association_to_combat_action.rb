class AddAssociationToCombatAction < ActiveRecord::Migration
  def change
  	add_reference :combat_actions, :user, index: true
    add_foreign_key :combat_actions, :user
  end
end
