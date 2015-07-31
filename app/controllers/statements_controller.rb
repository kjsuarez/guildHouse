class StatementsController < ApplicationController	
	include CharactersHelper
	
	def new
		@user = current_user
		@game = Game.find(params[:game_id])
		@all_monsters = @game.monsters
		@all_characters = @game.characters		
		@encounter = @game.encounters.where(active:true)[0]

		if @encounter
			@players = ([]<<@encounter.characters<<@encounter.monsters).flatten!
			@current_characters = @encounter.characters
			@current_monsters = @encounter.monsters
			turn_order = set_turn_order(@players)

		end
		
		if @user.id == @game.gamemaster_id		
			@all_actions = []
			@all_monsters.each do |monster|
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
  		@action = CombatAction.find(params[:action_id])
		@players = ([]<<@encounter.characters<<@encounter.monsters).flatten!
		turn_order = set_turn_order(@players)
		
  		if params[:player_type] == "monster" 
  			if (turn_order[@encounter.turn][0] == params[:player_id]&&turn_order[@encounter.turn][1] == "monster")
  				while count < @players.length
  					if params["player"+count.to_s] == '1' 
  						@targets << @players[count]
  					end
  					count+=1
  				end
  				puts "heres the phone! #{@targets}, also:#{@players.length}"
  				act(@targets)
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			else
  				flash[:danger] = "you can't act until your turn"
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			end
  		else
  			if (turn_order[@encounter.turn][0] == params[:player_id]&&
  			  	turn_order[@encounter.turn][1] == "character")
  				while count < @players.length
  					if params["player"+count.to_s] == '1' 
  						@targets << @players[count]
  					end
  					count+=1
  				end
  				puts "heres the phone! #{@targets}, also:#{@players.length}"
  				act(@targets)
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			else
  				flash[:danger] = "you can't act until your turn"
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			end
  		end
	end

##############
	def set_turn_order(players)
		turn_order = []
		players.each do |guy|; turn_order<<[guy.dice,find_type(guy)];end;
		turn_order.sort!
		return turn_order
	end

	def find_type(guy)
		if guy.class == Character
			return "character"
		else
			return "monster"
		end
	end

	def act(targets )
		puts "it finally worked"
	end

	def statement_params # selected attributes of user object passed as a hash
		params.require(:statement).permit(:content, :game_id, :character_id )
	end

end
