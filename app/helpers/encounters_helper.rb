module EncountersHelper
	
	def current_turn(turn, turn_order)
		
		player_id = turn_order[turn][0]; type = turn_order[turn][1]
		if type == "character"
			current_player = Character.find(player_id)
		elsif type == "monster"
			current_player = MonsterDatum.find(player_id)
		else
			puts "can't find current player in encounters helper"
			current_player == nil
		end
		return current_player
	end

	def take_turn()
		
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
