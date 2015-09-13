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

	def show
		@user = current_user
		@monster = Monster.find(params[:id])
		@abilities = @user.combat_actions
	end

	def save_abilities_to_monsters
		@monster = Monster.find(params[:monster_id])
		@user = current_user
		@abilities = @user.combat_actions
		targets = []
		#loop through @monsters,
		@abilities.each do |ability|
			#if a parameter with that monsters id exists associate it to @game
			if params["ability"+ability.id.to_s] == '1'
				@monster.combat_actions << ability
			else
				puts "#{ability} doesn't seem to be selected"	
			end
		end 
		@monster.save
		puts "#{@monster.combat_actions} "
		#save @game
		redirect_to @monster		
	end

############

	def monster_params
		params.require(:monster).permit(:name,:hit_points,:flavor_text,:cr,:xp,
				:init_mod,:ac,:hp,:strength,:dexterity,:constitution,
				:intelligence,:wisdom,:charisma,:fort_save,:ref_save,:will_save)
	end
end