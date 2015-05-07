class CharactersController < ApplicationController

	def new
		@character = Character.new
	end

	def create
		@character = Character.new(character_params)
		if @character.save
			redirect_to @character
		else
			flash[:danger] = "something went wrong"
		end
	end

	def show
		@character = Character.find(params[:id])	
	end

	def character_params
		params.require(:character).permit(:strength, :dexterity, :constitution, :inteligence, :wisdom, :charisma)
	end

end
