class User < ActiveRecord::Base
	has_many :Characters
	validates :email, presence: true, length: { maximum: 255 }
	validates :password, length: { minimum: 6 }
	#validates :username, presence: true
	has_secure_password
end
