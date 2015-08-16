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

			@players = ([]<<@encounter.character_data<<@encounter.monster_data).flatten!
			@current_characters = @encounter.character_data
			@current_monsters = @encounter.monster_data
			turn_order = set_turn_order(@players)
			@current_player = current_turn(@encounter.turn,turn_order)
			puts "\nIn new_statement method, guildHouse knows an encounter is active\n"
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
			@character_data = @character.character_data.where(encounter_id: @encounter.id)[0]||@character
			@character_actions = @character.combat_actions
			@statement = @character.statements.new(game_id: params[:game_id])
		end
		@statements = Statement.where(game_id: params[:game_id])
	end

	def create
		
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
		puts "trying to submit statement: #{params[:statement]} to game #{@game}"

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
		@players = ([]<<@encounter.character_data<<@encounter.monster_data).flatten!
		turn_order = set_turn_order(@players)
		@current_actor = current_actor(params[:player_type], params[:player_id])
		puts "\n From do_action, some one is trying to perform #{@action.name}"
		current_player = current_turn(@encounter.turn,turn_order)
		puts "From do_action guildHouse thinks it's #{is_monster?(current_player)}'s turn"  

		puts "\ncomparing actor: #{@current_actor} and player: #{current_player}"
		if @current_actor == current_player #if it's your turn, guildHouse accepts the action, else flash an error
			@targets = []
			puts "\nguildHouse thinks its the actors turn"
			puts "\n all players: #{@players}"
			while count < @players.length 
				if params["player"+count.to_s] == '1' 
					puts "\n player #{count.to_s} added to targets"
					@targets << @players[count]
				end
				count+=1
			end
			puts "\n made it past setting targets"
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
		puts "inside the act method, imposing action #{action} on #{targets}"
		unless action.frequency.nil?
			condition_hash = {combat_action_id: action.id}
			# loop through targets
			targets.each do |target|
				puts "before condition hash gets merged, action: #{action}, target: #{target}"
				hash = {turns_left: action.limit, onset_counter: action.onset, frequency_counter: action.frequency}
				puts "the original hash: #{hash}"
				condition_hash.merge!(hash)
				# make a new condition counter
				puts "the condition_hash: #{condition_hash}"
				target.condition_counters.new(condition_hash)
				puts "target: #{target} was hit with action: #{action}"
			end		
		else
			puts "Look at me I'm doing damage!"
			#immidiatly deal damage
			targets.each do |target|
				deal_damage(target, action.area, get_damage(action))
				puts "target: #{target} was hit with action: #{action}"
				result = "#{target} was hit with #{action} for #{action.damage} damage"
				statement = target.encounter.game.statements.new(content: result)
				statement.save
			end		
		end	
	end

	def statement_params # selected attributes of user object passed as a hash
		params.require(:statement).permit(:content, :game_id, :character_id )
	end
end






