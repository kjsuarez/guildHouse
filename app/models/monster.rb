class Monster < ActiveRecord::Base
	has_many :monster_ownerships
	has_many :users, :through => :monster_ownerships
	has_many :games, :through => :monster_ownerships
end
