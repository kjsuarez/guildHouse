class CharactersController < ApplicationController
	include CharactersHelper
	include SkillsetHelper
	include CharacterClassHelper

	before_action :logged_in_user, only: [:new]
	before_action :acceptible_values, only: [:create]
	
	def new
		@character = Character.new
	end

	def create
		@character = Character.new(character_params)
		@character.user_id = current_user.id
		set_scores
		@character.skill_set = to_json(skill_table)
		@character.skill_set = update_skill_mods(@character)
		@character.skill_set = set_class_skills(@character)
		@character.skill_set = update_total_skill_points(@character)
		@character.skill_set = set_ranks(@character)

		if @character.save			
			redirect_to @character
		else
			flash[:danger] = "something went wrong"
		end
	end

	def show
		@character = Character.find(params[:id])	
	end

	def index
		@characters = Character.where(user_id: current_user.id)
	end
###########################

	def character_params
		params.require(:character).permit(:strength, :dexterity,
		 :constitution, :intelligence, :wisdom, :charisma, :race,
		 :character_class, :hit_points, :level_table, :class_skills, :skill_set)
	end

	def logged_in_user
      unless logged_in?
        flash[:danger] = "login to create a character"
        redirect_to login_url
      end 		
	end

	def acceptible_values
		@character = Character.new(character_params)
		
			if @character.strength.to_i ==0 || @character.dexterity.to_i == 0||
				@character.constitution.to_i ==0|| @character.intelligence.to_i ==0||
				@character.wisdom.to_i ==0|| @character.charisma.to_i ==0	
				
				flash[:danger] = "login to create a character"
	        	redirect_to character_creater_url 	
			end
	end



	def to_json(hash)
		ActiveSupport::JSON.encode(hash)
	end

	def set_scores
		@character.strength = to_json(set_score(@character.strength,score_to_mod(@character.strength.to_i)))
		@character.dexterity = to_json(set_score(@character.dexterity,score_to_mod(@character.dexterity.to_i)))
		@character.constitution = to_json(set_score(@character.constitution,score_to_mod(@character.constitution.to_i)))
		@character.intelligence = to_json(set_score(@character.intelligence,score_to_mod(@character.intelligence.to_i)))
		@character.wisdom = to_json(set_score(@character.wisdom,score_to_mod(@character.wisdom.to_i)))
		@character.charisma = to_json(set_score(@character.charisma,score_to_mod(@character.charisma.to_i)))
	end

	def set_skills
		@character.skill_set = to_json(skill_table) 
	end

	def score_to_mod(score)  	# the formula that derives ability
		modifier = (score/2)-5 	# modifier from ability score
		return modifier
	end
end


