module SkillsetHelper
	def test
		return "hi"
	end

	def update_skill_mods(character)
		#update_ability_modifiers

		skill_arry = json_to_hash(character.skill_set).to_a #json=>hash=>arry
		@strength = json_to_hash(character.strength)
		@dexterity = json_to_hash(character.dexterity)
		@wisdom = json_to_hash(character.wisdom)
		@intelligence = json_to_hash(character.intelligence)
		@constitution = json_to_hash(character.constitution)
		@charisma = json_to_hash(character.charisma)

		count = 1

		related_ability = skill_arry[count][1]["related_ability"]
		ability_mod = skill_arry[count][1][:ability_mod]

		while count < skill_arry.length
			
			if skill_arry[count][1]["related_ability"] == "Dexterity"
				skill_arry[count][1][:ability_mod] = @dexterity["mod"]
	
				elsif skill_arry[count][1]["related_ability"] == "Strength"
					skill_arry[count][1][:ability_mod] = @strength["mod"]		
				
				elsif skill_arry[count][1]["related_ability"] == "Wisdom"
					skill_arry[count][1][:ability_mod] = @wisdom["mod"]
				
				elsif skill_arry[count][1]["related_ability"] == "Intelligence"
					skill_arry[count][1][:ability_mod] = @intelligence["mod"]	

				elsif skill_arry[count][1]["related_ability"] == "Charisma"
					skill_arry[count][1][:ability_mod] = @charisma["mod"]		

				elsif skill_arry[count][1]["related_ability"] == "Constitution"
					skill_arry[count][1][:ability_mod] = @constitution["mod"]
				else
					puts "compare #{skill_arry[count][1]["related_ability"]} to #{ability_mod}"
			end

			count+=1
		end

		character.skill_set = to_json(Hash[skill_arry])
	end

	def skill_table
		
		skills = {  		:ranks => 0,

			:acrobatics => { :skill_name => "Acrobatics", :Total_bonus => nil,
				 			:related_ability => "Dexterity",
				  			:ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:appraise => { :skill_name => "Appraise", :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:bluff => { :skill_name => "Bluff", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:climb => { :skill_name => "Climb", :Total_bonus => nil,
				 		:related_ability => "Wisdom",
				 		:ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },
		
			:craft1 => { :skill_name => "Craft____", :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:craft2 => { :skill_name => "Craft____", :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },
				  
			:craft3 => { :skill_name => "Craft____", :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	  	  

			:diplomacy => { :skill_name => "Diplomacy", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:disable_device => { :skill_name => "Disable device", :Total_bonus => nil,
				 :related_ability => "Dexterity",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	
				  
			:disguise => { :skill_name => "Disguise", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:escape_artist => { :skill_name => "Escape artist", :Total_bonus => nil,
				 :related_ability => "Dexterity",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:fly => { :skill_name => "Fly", :Total_bonus => nil,
				 :related_ability => "Dexterity",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:handle_animal => { :skill_name => "Handle animal", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:heal => { :skill_name => "Heal", :Total_bonus => nil,
				 :related_ability => "Wisdom",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	

			:intimidate => { :skill_name => "Intimidate", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	
				  
			:knowledge_arcana => { :skill_name => "Knowledge arcana", :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:knowledge_dungeoneering => { :skill_name => "Knowledge dungeoneering",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },
				  
			:knowledge_engineering => { :skill_name => "Knowledge engineering",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },
				  
			:knowledge_geography => { :skill_name => "Knowledge geography",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:knowledge_history => { :skill_name => "Knowledge history",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },
				  
			:knowledge_local => { :skill_name => "Knowledge local",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:knowledge_nature => { :skill_name => "Knowledge nature",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:knowledge_nobility => { :skill_name => "Knowledge nobility", 
					:Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:knowledge_planes => { :skill_name => "Knowledge planes",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },
				  
			:knowledge_religion => { :skill_name => "Knowledge religion",
				 :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:linguistics => { :skill_name => "Linguistics", :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	  	   	  	  	        	  	      		 

			:perception => { :skill_name => "Perception", :Total_bonus => nil,
				 :related_ability => "Wisdom",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	

			:perform1 => { :skill_name => "Perform____", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	  

			:perform2 => { :skill_name => "Perform____", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	  

			:profession1 => { :skill_name => "Profession____", :Total_bonus => nil,
				 :related_ability => "Wisdom",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	

			:profession2 => { :skill_name => "Profession____", :Total_bonus => nil,
				 :related_ability => "Wisdom",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	

			:profession1 => { :skill_name => "Profession", :Total_bonus => nil,
				 :related_ability => "Wisdom",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	  

			:ride => { :skill_name => "Ride", :Total_bonus => nil,
				 :related_ability => "Dexterity",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:sense_motive => { :skill_name => "Sense motive", :Total_bonus => nil,
				 :related_ability => "Wisdom",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },
				  
			:sleight_of_hand => { :skill_name => "Sleight of hand", :Total_bonus => nil,
				 :related_ability => "Dexterity",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	 

			:spellcraft => { :skill_name => "Spellcraft", :Total_bonus => nil,
				 :related_ability => "Intelligence",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	

			:stealth => { :skill_name => "Stealth", :Total_bonus => nil,
				 :related_ability => "Dexterity",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:survival => { :skill_name => "Survival", :Total_bonus => nil,
				 :related_ability => "Wisdom",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },

			:swim => { :skill_name => "Swim", :Total_bonus => nil,
				 :related_ability => "Strength",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil },	

			:use_magic_device => { :skill_name => "Use magic device", :Total_bonus => nil,
				 :related_ability => "Charisma",
				  :ability_mod => nil, :ranks => nil, :race_bonus => nil, :class_skill_bonus => nil }	    	       	  	  

		}
		return skills
	end
end




