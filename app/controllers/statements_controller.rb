class StatementsController < ApplicationController	
	include CharactersHelper
	include EncountersHelper
	
	def new
		@user = current_user
		@game = Game.find(params[:game_id])
		@all_monsters = @game.monsters
		@all_characters = @game.characters		
		@encounter = @game.encounters.where(active:true)[0]

		if @encounter
			@players = ([]<<@encounter.characters<<@encounter.monster_data).flatten!
			@current_characters = @encounter.characters
			@current_monsters = @encounter.monster_data
			turn_order = set_turn_order(@players)
			
			@current_player = current_turn(@encounter.turn,turn_order)
			puts "this is it #{turn_order}"
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
		@players = ([]<<@encounter.characters<<@encounter.monster_data).flatten!
		turn_order = set_turn_order(@players)
		puts "blablablabla: #{@encounter.turn}, #{turn_order}"
		current_player = current_turn(@encounter.turn,turn_order)
		  

  		if params[:player_type] == "monster" 
  			if (params[:player_id].to_i == current_player.id  &&turn_order[@encounter.turn][1] == "monster")
  				while count < @players.length
  					if params["player"+count.to_s] == '1' 
  						@targets << @players[count]
  					end
  					count+=1
  				end
  				act(@action,@targets)
  				puts "turn method: #{next_turn(@encounter.turn, @players.length)}"
  				@encounter.turn = next_turn(@encounter.turn, @players.length)
  				@encounter.save
  				take_turn(current_player)
  				puts "the encounters turn: #{@encounter.turn}"
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			else
  				flash[:danger] = "you can't act until your turn" 
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			end
  		else
  			if (params[:player_id].to_i == current_player.id && turn_order[@encounter.turn][1] == "character")
  				while count < @players.length
  					if params["player"+count.to_s] == '1' 
  						@targets << @players[count]
  					end
  					count+=1
  				end
  				act(@action,@targets)
  				puts "turn method: #{next_turn(@encounter.turn, @players.length)}"
  				@encounter.turn = next_turn(@encounter.turn, @players.length)
  				@encounter.save
  				take_turn(current_player)
  				puts "the encounters turn: #{@encounter.turn}"
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			else
  				flash[:danger] = "you can't act until your turn"
  				redirect_to "/games/#{ params[:game_id] }/statements/new"
  			end
  		end
	end

##############
	def next_turn(turn, players_length)
		if turn == players_length-1
			turn = 0
		else
			turn+=1
		end
		return turn
	end

	def act(action,targets)
		puts "it finally worked"
		unless action.frequency.nil?
			condition_hash = {combat_action_id: action.id}
			# loop through targets
			targets.each do |target|
			condition_hash.merge({turns_left: action.limit, onset_counter: action.onset, frequency_counter: action.frequency})
			# make a new condition counter
			target.condition_counters.new(condition_hash)		
		end
		else
			#immidiatly deal damage
			#say you did damage
		end	
	end

	def statement_params # selected attributes of user object passed as a hash
		params.require(:statement).permit(:content, :game_id, :character_id )
	end

end






