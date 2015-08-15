class CharacterDatum < ActiveRecord::Base
	belongs_to :encounter
	belongs_to :character
	has_many :condition_counters
end
