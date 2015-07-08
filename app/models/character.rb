 class Character < ActiveRecord::Base
	belongs_to :user
	has_many :statements

	has_many :action_ownerships
	has_many :combat_actions, :through => :action_ownerships	
end
