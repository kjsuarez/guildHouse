module EncountersHelper
	
	def is_monster?(current_player)
		if current_player.class ==  MonsterDatum
			x = current_player.monster.name 
		else 
			x = current_player.character.name 
		end 
		return x
	end

	def current_turn(turn, turn_order)
		puts "your looking for this:  #{turn},#{turn_order}"
		player_id = turn_order[turn][0]; type = turn_order[turn][1]
		if type == "character"
			current_player = CharacterDatum.find(player_id)
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
		if guy.class == CharacterDatum
			return "character"
		elsif guy.class == MonsterDatum
			return "monster"
		else
			put "player class isn't characterdata or monsterdata "
		end
	end	

	def set_turn_order(players)
		turn_order = []
		players.each do |guy|; turn_order<<[guy.id,find_type(guy)];end;
		turn_order.sort!.reverse!
		return turn_order
	end

	def get_damage(action)
		damage = action.damage
		dice_regex = /^\d+(d)\d+$/
		num_regex = /^\d+$/
		if dice_regex.match(damage)
			damage = dice_roll(number_of_dice(damage), size_of_dice(damage))
			return damage
		elsif num_regex.math(damage)
			damage = damage.to_i		
			return damage
		else
			puts "something went wrong in encounter_helper"
		end
	end

	def deal_damage(target, area, damage)
		#deal damage to target at area
	
		if area == "hp"
			target.current_hp = target.current_hp-damage
			target.save
			
		elsif area == "strength"

		elsif area == "dexterity"
		
		elsif area == "constitution"

		elsif area == "intellidence"		 
			
		elsif area == "wisdom"			
					
		else
			
		end			
		
		#hp
		#strength
		#dexterity
		#constitution
		#intellidence
		#wisdom
	end

	def number_of_dice(str)
		thing = str.index("d")
		return str[0..thing-1].to_i
	end

	def size_of_dice(str)
		thing = str.index("d")
		return str[thing-1..-1].to_i
	end

	def dice_roll(number,size)
		value = 0
		number.times do value += rand(size)+1; puts value; end		
		return value
	end
	
end







