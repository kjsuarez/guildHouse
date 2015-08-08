class Monster < ActiveRecord::Base
	has_many :monster_ownerships
	has_many :monster_data
	
	has_many :users, :through => :monster_ownerships
	has_many :games, :through => :monster_ownerships

	has_many :action_ownerships
	has_many :combat_actions, :through => :action_ownerships

	has_many :encounter_ownerships
	has_many :encounters, :through => :encounter_ownerships
	has_many :characters, :through => :encounter_ownerships	
end
