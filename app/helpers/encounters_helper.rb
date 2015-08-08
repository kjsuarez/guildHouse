module EncountersHelper
	
	def is_monster?(current_player)
		if current_player.class ==  MonsterDatum
			x = current_player.monster.name 
		else 
			x = current_player.name 
		end 
		return x
	end

	def current_turn(turn, turn_order)
		puts "your looking for this:  #{turn},#{turn_order}"
		player_id = turn_order[turn][0]; type = turn_order[turn][1]
		if type == "character"
			current_player = Character.find(player_id)
		elsif type == "monster"
			current_player = MonsterDatum.find( player_id)
		else
			puts "can't find current player in encounters helper"
			current_player == nil
		end
		
		return current_player
	end

	def take_turn(current_player)
		#loop through curent_player's afflictions
		#if onset>0 then onset-1 
		#else:
		#if frequency>0, frequency-1,
		#else:
		#set frequency_counter to affliction.action.frequency
		#deal damage to area
		#wait for current_player to act
		
	end

	def find_type(guy)
		if guy.class == Character
			return "character"
		else
			return "monster"
		end
	end	

	def set_turn_order(players)
		turn_order = []
		players.each do |guy|; turn_order<<[guy.id,find_type(guy)];end;
		turn_order.sort!.reverse!
		return turn_order
	end
	
end
