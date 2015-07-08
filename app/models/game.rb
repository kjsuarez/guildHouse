class Game < ActiveRecord::Base
	has_many :characters
	has_many :statements
	has_many :monster_ownerships
	has_many :monsters, :through => :monster_ownerships	
end
