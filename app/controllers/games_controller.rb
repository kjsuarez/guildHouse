class GamesController < ApplicationController
	include CharactersHelper

	before_action :character_belongs_to_game, only: [:edit]
	def new
		@game = Game.new
	end

	def create
		@game = Game.new(params[:game])
		@game.body = "game initiated"
		@game.save
		redirect_to @game
	end

	def show

	 	@game = Game.find(params[:id])
	end 

	def edit
		@game = Game.find(params[:id])
	end
	def update
		x = json_to_hash(my_character.strength)
		@game = Game.find(params[:id])
		puts "hey #{params["game"]["statement"]}"
		if params["game"]["statement"] == "strength"
			puts "here it is #{json_to_hash(my_character.strength)["mod"]}"
			@game.body = @game.body << "strength_mod: #{x}"
		else
			@game.body = @game.body << params["game"]["statement"]
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
	end
#################
    def game_params
      params.require(:game).permit(:body, :statement)
    end	

    def character_belongs_to_game
    	puts "hey hey #{params[:id]}"
    	@game_id = params[:id]
    	@user_id = current_user.id
    	@characters = Character.where(user_id: @user_id)
    	pass = 0; count = 0;
    	while count < @characters.length
    		if @characters[0].game_id == @game_id.to_i
    			puts "WE DID IT"; count +=1
    		end
    	end    
    	unless count > 0
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
