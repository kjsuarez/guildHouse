class Game < ActiveRecord::Base
	has_many :characters
	has_many :statements
end
