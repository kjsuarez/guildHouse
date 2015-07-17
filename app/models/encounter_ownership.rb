class EncounterOwnership < ActiveRecord::Base
	belongs_to :encounter
	belongs_to :monster
	belongs_to :game	
end
