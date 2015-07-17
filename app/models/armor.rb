class Armor < ActiveRecord::Base
	has_many :item_ownerships
	has_many :users, :through => :item_ownerships
	has_many :characters, :through	=> :item_ownerships
	has_many :games, :through	=> :item_ownerships
	has_many :combat_actions, :through	=> :item_ownerships			
end
