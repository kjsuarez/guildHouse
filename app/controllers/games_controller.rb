class GamesController < ApplicationController
	include CharactersHelper

	before_action :character_belongs_to_game, only: [:edit]
	def new
		@game = Game.new@user.monsters
	end

	def create
		@game = Game.new(params[:game])
		@game.gamemaster_id = current_user.id
		@game.body = "game initiated"
		@game.save
		redirect_to @game
	end

	def show
		@user = current_user
	 	@game = Game.find(params[:id])
	 	@monsters = @user.monsters
	 	@current_monsters = @game.monsters
	 	@characters = @game.characters
	 	@encounters = @game.encounters
	end 

	def edit
		@user = User.find(current_user.id)
		@character = @user.characters.where(game_id: params[:id])[0]
		@game = Game.find(params[:id])
		@statement = @character.statements.new(game_id: params[:id])

	end
	
	def update		
		@break = "<p>#{params["game"]["statement"]} <p>"
		@user = User.find(current_user)
		@character = @user.characters.where(game_id: params[:id])[0]
		x = json_to_hash(my_character.strength)
		@game = Game.find(params[:id])
		@statement = @character.statements.new(game_id: params[:id])
		puts "hey #{params["game"]["statement"]}"
		if params["game"]["statement"] == "strength"
			#puts "here it is #{json_to_hash(my_character.strength)["mod"]}"
			@game.body = @game.body << "strength_mod: #{x}"
		else
			@game.body = @game.body << "#{@break}"
		end		
		@game.statement = nil
		@game.update_attributes(game_params)
		render 'edit'
	end

	def index
		@games = Game.all
	end

	def pick_character
		@game = Game.find(params[:game])
		@user = User.find(params[:guy])
		@characters = Character.where(user_id: params[:guy])
	end

	def add_character_to_game
		@user = User.find(params[:guy])
		@character = Character.find(params[:character])
		@character.update_attribute(:game_id, params[:game])
		params[:id] = params[:game]
		redirect_to "/games/#{params[:game]}/characters"
	end

	def game_characters
		@game = Game.find(params[:id])
		@characters = @game.characters

	end

	def games_you_play
		ids=[]; @guys = current_user.characters
		@guys.find_each do |guy|
			ids << guy.game_id
		end	
		@games_you_play = Game.where(id: ids)
		@your_games = Game.where(gamemaster_id: current_user.id)
	end

	def games_you_run
		@your_games = Game.where(gamemaster_id: current_user.id)
	end

	def add_monsters_to_games
		@game = Game.find(params[:id])
		@user = current_user
		@monsters = @user.monsters
	end

	def save_monsters_to_games
		
	end
#################
    def game_params
      params.require(:game).permit(:body, :statement)
    end	

    def character_belongs_to_game
    	puts "hey hey #{params[:id]}"
    	@game_id = params[:id]
    	@user_id = current_user.id
    	@characters = Character.where(user_id: @user_id).where(game_id: params[:id])
    
    	
    	if @characters[0] == nil
    			flash[:danger] = "you can only edit games you belong to"
    			redirect_to root_url
    	end	
    end
    def my_character
    	@game = Game.find(params[:id])
    	@character = @game.characters.where(user_id: current_user.id)[0]
    	return @character
    end
end
