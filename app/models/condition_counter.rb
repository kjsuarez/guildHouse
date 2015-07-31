class ConditionCounter < ActiveRecord::Base
	belongs_to :character
	belongs_to :monster_datum
	belongs_to :combat_action
end
