class MonsterDatum < ActiveRecord::Base
	belongs_to :encounter
	belongs_to :monster
	has_many :condition_counters
end
