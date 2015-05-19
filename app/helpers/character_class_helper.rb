module CharacterClassHelper
	
	def set_class_skills(character)
		job_skills = class_skills(character)   # [:appraise, :craft1, :fly]
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

	def class_skills(character)
		job = character.character_class
		if job == "rogue"
			puts "HEY HEY Hi!"
			class_skills = [:acrobatics, :appraise, :bluff, :climb, :craft1, :diplomacy, 
				:disable_device, :disguise, :escape_artist, :intimidate,
				 :knowledge_dungeoneering, :knowledge_local, :linguistics, :perception,
				 :perform1, :profession1, :sense_motive, :sleight_of_hand, :stealth,
				 :swim, :use_magic_device]
			return class_skills	 
		else
			puts "Trouble"	
			return []	 
		end
		
	end
end