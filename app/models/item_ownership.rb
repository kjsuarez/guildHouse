class ItemOwnership < ActiveRecord::Base
      belongs_to :armor
      belongs_to :weapon
      belongs_to :user
      belongs_to :character
      belongs_to :game
      belongs_to :combat_action
end
