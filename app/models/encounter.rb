class Encounter < ActiveRecord::Base
	belongs_to :game

	has_many :encounter_ownerships
	has_many :characters, :through => :encounter_ownerships
	has_many :monsters, :through => :encounter_ownerships
end
