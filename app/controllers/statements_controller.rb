class StatementsController < ApplicationController	
	include CharactersHelper
	
	def new
		@user = current_user
		@game = Game.find(params[:game_id])
		@monsters = @game.monsters
		@all_characters = @game.characters		
		@encounter = @game.encounters.where(active:true)[0]
		if @encounter
			@players = ([]<<@encounter.characters<<@encounter.monsters).flatten!
		end
		
		if @user.id == @game.gamemaster_id		
			@all_actions = []
			@monsters.each do |monster|
				@actions = monster.combat_actions
				@all_actions << @actions
			end	
			@all_actions.flatten!
				
			@statement = @user.statements.new(game_id: params[:game_id])
		else
			@character = @user.characters.where(game_id: params[:game_id])[0]
			@character_actions = @character.combat_actions
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

	def do_action
		count=0
		@targets =[]
  		@game = Game.find(params[:game_id])
  		@encounter = @game.encounters.where(active:true)[0]
		@players = ([]<<@encounter.characters<<@encounter.monsters).flatten!
  		while count < @players.length
  			puts "BANG #{params["player"+count.to_s]}"
  			if params["player"+count.to_s] == '1' 

  				@targets << @players[count]
  			end
  			count+=1
  		end
  		puts "heres the phone! #{@targets}, also:#{@players.length}"
  		redirect_to "/games/#{ params[:game_id] }/statements/new"
	end


	def statement_params # selected attributes of user object passed as a hash
		params.require(:statement).permit(:content, :game_id, :character_id )
	end

end
