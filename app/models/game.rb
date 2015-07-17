class Game < ActiveRecord::Base
	has_many :characters
	has_many :statements
	has_many :encounters
	
	has_many :monster_ownerships
	has_many :monsters, :through => :monster_ownerships	

	has_many :item_ownerships
	has_many :weapons, :through => :item_ownerships
	has_many :armors, :through	=> :item_ownerships	
end
