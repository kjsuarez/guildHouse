class MonsterDatum < ActiveRecord::Base
	belongs_to :encounter
	belongs_to :monster
end
