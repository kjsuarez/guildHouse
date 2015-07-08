class MonsterOwnership < ActiveRecord::Base
	belongs_to :user
	belongs_to :monster
	belongs_to :game
end
