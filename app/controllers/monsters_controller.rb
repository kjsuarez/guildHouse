class MonstersController < ApplicationController
	def new
		@monster = Monster.new
	end

	def create
		@user = current_user
		@monster = @user.monsters.new(monster_params)
		@monster.save
		redirect_to @user
	end

############

	def monster_params
		params.require(:monster).permit(:name,:flavor_text,:cr,:xp,
				:init_mod,:ac,:hp,:strength,:dexterity,:constitution,
				:intelligence,:wisdom,:charisma,:fort_save,:ref_save,:will_save)
	end
end