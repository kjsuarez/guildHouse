class ActionOwnership < ActiveRecord::Base
	belongs_to :character
	belongs_to :monster
	belongs_to :combat_action
end
