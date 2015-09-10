class MonstersController < ApplicationController
	def new
		@user = current_user
		@monster = @user.monsters.new
	end

	def create
		@user = current_user
		puts "the user this monster belongs to: @user"
		@monster = Monster.new(monster_params)
		@user.monsters << @monster
		@monster.save
		redirect_to @user
	end

############

	def monster_params
		params.require(:monster).permit(:name,:hit_points,:flavor_text,:cr,:xp,
				:init_mod,:ac,:hp,:strength,:dexterity,:constitution,
				:intelligence,:wisdom,:charisma,:fort_save,:ref_save,:will_save)
	end
end