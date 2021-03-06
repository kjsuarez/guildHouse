class User < ActiveRecord::Base
	has_many :characters
	has_many :statements
	has_many :combat_actions

	has_many :monster_ownerships
	has_many :monsters, :through => :monster_ownerships	

	has_many :item_ownerships
	has_many :weapons, :through => :item_ownerships
	has_many :armors, :through	=> :item_ownerships	

	validates :email, presence: true, length: { maximum: 255 }
	validates :password, length: { minimum: 6 }
	#validates :username, presence: true
	has_secure_password
end
