module CharacterClassHelper
	
	def hitdice(character)
		job = character.character_class
		hitdice = nil
		if job == "Bard"
			hitdice = 8
		elsif job == "Druid"
			hitdice = 8
		elsif job == "Barbarian"
			hitdice = 12
		elsif job == "Cleric"
			hitdice = 8
		elsif job == "Fighter"
			hitdice = 10
		elsif job == "Monk"
			hitdice = 8
		elsif job == "Paladin"
			hitdice = 10
		elsif job == "Ranger"
			hitdice = 10
		elsif job == "Rogue"
			hitdice = 8	
		elsif job == "Sorcerer"
			hitdice = 6
		elsif job == "Wizard"
			hitdice = 6										
		end
		return hitdice
	end

	def set_class_skills(character)
		job_skills = class_skills_ranks(character)[0]   # [:appraise, :craft1, :fly]
		skill_hash = json_to_hash(character.skill_set)		# {:acrobatics => { :skill_name => "Acrobatics", :Total_bonus => nil}}
		count = 0
		while count < job_skills.length
			class_skill = job_skills[count]
			
			skill_hash[class_skill.to_s]["class_skill_bonus"] = 3
			#puts "RIGHT HERE: #{skill_hash[class_skill.to_s]}"
			count+=1
		end
		return to_json(skill_hash)
	end

	def set_ranks(character)
		skill_hash = json_to_hash(character.skill_set)
		pre_int_ranks = class_skills_ranks(character)[1]
		intel = json_to_hash(character.intelligence)
		skill_hash[:ranks] = pre_int_ranks + intel["mod"]

		return to_json(skill_hash)
	end

	def class_skills_ranks(character)
		job = character.character_class
		class_skills =[]
		if job == "Rogue"
			class_skills = [:acrobatics,:appraise,:bluff,:climb,:craft1,:diplomacy, 
				:disable_device,:disguise,:escape_artist,:intimidate,
				 :knowledge_dungeoneering,:knowledge_local,:linguistics,:perception,
				 :perform1,:profession1,:sense_motive,:sleight_of_hand,:stealth,
				 :swim, :use_magic_device]
			ranks = 8	 
			 
		elsif job == "Sorcerer"
			class_skills = [:appraise,:bluff,:craft1,:fly,:intimidate,:knowledge_arcana,
						:profession1,:spellcraft,:use_magic_device]
			ranks = 2			

		elsif job == "Wizard"
			class_skills = [:appraise, :craft1, :fly, :knowledge_arcana, 
				  :knowledge_dungeoneering, :knowledge_engineering,
				  :knowledge_geography, :knowledge_history, :knowledge_local,
				  :knowledge_nature,:knowledge_nobility, :knowledge_planes, 
				  :knowledge_religion, :linguistics, :profession1, :spellcraft]
			ranks = 2	  

		elsif job == "Barbarian"
			class_skills = [:acrobatics,:climb,:craft1,:handle_animal,:intimidate,
						:knowledge_nature,:perception,:ride,:survival,:swim]
			ranks = 4	

		elsif job == "Bard"
			class_skills = [:acrobatics,:appraise,:bluff,:climb,:craft1,:diplomacy,
				:disguise,:escape_artist,:intimidate,:knowledge_arcana,:knowledge_dungeoneering,
				:knowledge_engineering,:knowledge_geography,:knowledge_history,
				:knowledge_local,:knowledge_nature,:knowledge_nobility,:knowledge_planes,
				:knowledge_planes,:linguistics,:perception,:perform1,:profession1,
				:sense_motive,:sleight_of_hand,:spellcraft,:stealth,:use_magic_device]
			ranks = 6

		elsif job == "Cleric"
			class_skills = [:appraise,:craft1,:diplomacy,:heal,:knowledge_arcana,
				:knowledge_history,:knowledge_nobility, :knowledge_planes,
				:knowledge_religion,:linguistics,:profession1,:sense_motive,:spellcraft]
			ranks = 2	

		elsif job == "Monk"
			class_skills = [:acrobatics,:climb,:craft1,:escape_artist,:intimidate,
				:knowledge_history,:knowledge_religion,:perception,:perception,
				:perform1,:profession1,:ride,:sense_motive,:stealth,:swim]
			ranks = 4	

		elsif job == "Druid"
			class_skills = [:climb,:craft1,:fly,:handle_animal,:heal,:knowledge_geography,
							:knowledge_nature,:perception,:profession1,:ride,:spellcraft,
							:survival,:swim]
			ranks = 4	

		elsif job == "Paladin"
			class_skills = [:craft1,:diplomacy,:handle_animal,:heal,:knowledge_nobility,
				:knowledge_religion,:profession1,:ride,:sense_motive,:spellcraft]
			ranks = 2	

		elsif job == "Fighter"
			class_skills = [ :climb, :craft1, :handle_animal, :intimidate,
						  :knowledge_dungeoneering, :knowledge_engineering,
						  :profession1, :ride, :survival, :swim ]	
			ranks = 2	

		elsif job == "Ranger"
			class_skills = [ :climb, :craft1, :handle_animal,
				  :heal, :intimidate, :knowledge_dungeoneering,
				  :knowledge_geography, :knowledge_nature, :perception,
				  :profession1, :ride, :spellcraft, :stealth, :survival, :swim ]
			ranks = 6

		else
			puts "Trouble"; puts "Trouble"; puts "Trouble"			 
		end
		return [class_skills,ranks]	
	end
end