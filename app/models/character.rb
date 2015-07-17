 class Character < ActiveRecord::Base
	belongs_to :user
	has_many :statements

	has_many :action_ownerships
	has_many :combat_actions, :through => :action_ownerships	

	has_many :item_ownerships
	has_many :weapons, :through => :item_ownerships
	has_many :armors, :through	=> :item_ownerships

	has_many :encounter_ownerships
	has_many :characters, :through => :encounter_ownerships
	has_many :encounters, :through => :encounter_ownerships	
end
