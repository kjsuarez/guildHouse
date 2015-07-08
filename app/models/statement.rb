class Statement < ActiveRecord::Base
	belongs_to :character
	belongs_to :game
	belongs_to :user
end
