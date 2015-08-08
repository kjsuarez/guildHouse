class EncountersController < ApplicationController
	def new
		@encounter = Encounter.new
		@game = Game.find(params[:game_id])
		@characters = @game.characters
		@monsters = @game.monsters
	end

	def create
		@encounter = Encounter.new(encounter_params); @encounter.save
		@game = Game.find(params[:game_id])
		@all_characters = @game.characters
		@all_monsters = @game.monsters
		@added_characters = []; @added_monsters = [];
		count = 0;
		while count < @all_monsters.length
			unless (params["mon"+@all_monsters[count].id.to_s].nil?)
				@added_monsters << [@all_monsters[count].id , params["mon"+@all_monsters[count].id.to_s]["number"]]				
			end
			count +=1;
		end
		count = 0;
		while count < @all_characters.length
			unless (params["guy"+@all_characters[count].id.to_s].nil?)
				@added_characters << @all_characters[count].id
			end
			count+=1;
		end

		@added_monsters.each_index do |index|
			@added_monsters[index][1].to_i.times do
				mon = MonsterDatum.new(monster_id: @added_monsters[index][0], encounter_id: @encounter.id)	
				mon.save
			end
		end

		@added_characters.each do |id|
			@encounter.characters << Character.find(id)
		end
		@game.encounters << @encounter
		@game.save
		@encounter.save
		redirect_to "/games/#{ params[:game_id] }/statements/new"
	end
	



#############
	def encounter_params # selected attributes of user object passed as a hash
		params.require(:encounter).permit(:name, :active, :game_id)
	end
end





