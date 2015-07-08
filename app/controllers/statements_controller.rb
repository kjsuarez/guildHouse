class StatementsController < ApplicationController	
	include CharactersHelper
	
	def new
		@user = current_user
		@game = Game.find(params[:game_id])
		@all_characters = Character.where(game_id: params[:game_id])
		if @user.id == @game.gamemaster_id			
			@statement = @user.statements.new(game_id: params[:game_id])
		else
			@character = @user.characters.where(game_id: params[:game_id])[0]
			@statement = @character.statements.new(game_id: params[:game_id])
		end
		@statements = Statement.where(game_id: params[:game_id])
	end

	def create
		puts "shere shere shere: #{params[:statement]}"
		@game = Game.find(params[:game_id])
		@user = current_user	
		if @user.id == @game.gamemaster_id			
			@statement = Statement.new(statement_params)	
			@statement.user_id = @user.id
		else
			@character = @user.characters.where(game_id: params[:game_id])[0]
			@statement = Statement.new(statement_params)	
			@statement.character_id = @character.id
		end		
		

		@statement.game_id = params[:game_id]
		@statement.save
		redirect_to "/games/#{ params[:game_id] }/statements/new"
	end

	def play
		@user = current_user
		@game = Game.find(params[:id])
		@character = @user.characters.where(game_id: params[:id])[0]
		@statement = @character.statements.new(game_id: params[:id])

	end



	def statement_params # selected attributes of user object passed as a hash
		params.require(:statement).permit(:content, :game_id, :character_id )
	end

end
