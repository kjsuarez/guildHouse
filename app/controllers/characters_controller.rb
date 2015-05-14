class CharactersController < ApplicationController
	before_action :logged_in_user, only: [:new]
	before_action :acceptible_values, only: [:create]
	def new
		@character = Character.new
	end

	def create
		@character = Character.new(character_params)
		@character.user_id = current_user.id
		if @character.save			
			redirect_to @character
		else
			flash[:danger] = "something went wrong"
		end
	end

	def show
		@character = Character.find(params[:id])	
	end
###########################

	def character_params
		params.require(:character).permit(:strength, :dexterity,
		 :constitution, :intelligence, :wisdom, :charisma, :race)
	end

	def logged_in_user
      unless logged_in?
        flash[:danger] = "login to create a character"
        redirect_to login_url
      end 		
	end

	def acceptible_values
		@character = Character.new(character_params)
		if @character.strength == "-"
			redirect_to login_url
		end
	end

end
