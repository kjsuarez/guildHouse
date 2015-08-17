class CombatAction < ActiveRecord::Base
	belongs_to :user

	has_many :condition_counters

	has_many :action_ownerships
	has_many :monsters, :through => :action_ownerships
	has_many :characters, :through => :action_ownerships

	has_many :item_ownerships
	has_many :weapons, :through => :item_ownerships
	has_many :armors, :through	=> :item_ownerships
end
