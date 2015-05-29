module CharactersRaceHelper
	def add_racial_bonuses(character, choice = nil)
		race = character.race
		strength = json_to_hash(character.strength)
		dexterity = json_to_hash(character.dexterity)
		constitution = json_to_hash(character.constitution)
		intelligence = json_to_hash(character.intelligence)
		wisdom = json_to_hash(character.wisdom)
		charisma = json_to_hash(character.charisma)

		
		if race == "Human"
			strength["score"] += human(:racial_bonuses)[:strength]
			dexterity["score"] += human(:racial_bonuses)[:dexterity]
			constitution["score"] += human(:racial_bonuses)[:constitution]
			intelligence["score"] += human(:racial_bonuses)[:intelligence]
			wisdom["score"] += human(:racial_bonuses)[:wisdom]
			charisma["score"] += human(:racial_bonuses)[:charisma]

		elsif race == "Elf"
			dexterity["score"] += elf(:racial_bonuses)[:dexterity]
			constitution["score"] += elf(:racial_bonuses)[:constitution]
			intelligence["score"] += elf(:racial_bonuses)[:intelligence]
			
		elsif race == "Halfelf"
			strength["score"] += halfelf(:racial_bonuses)[:strength]
			dexterity["score"] += halfelf(:racial_bonuses)[:dexterity]
			constitution["score"] += halfelf(:racial_bonuses)[:constitution]
			intelligence["score"] += halfelf(:racial_bonuses)[:intelligence]
			wisdom["score"] += halfelf(:racial_bonuses)[:wisdom]
			charisma["score"] += halfelf(:racial_bonuses)[:charisma]

		elsif race == "Dwarf"
			#strength[:score] += dwarf("racial_bonuses")[:strength]
			#dexterity[:score] += dwarf("racial_bonuses")[:dexterity]
			constitution["score"] += dwarf(:racial_bonuses)[:constitution]
			#intelligence[:score] += dwarf("racial_bonuses")[:intelligence]
			#wisdom[:score] += dwarf("racial_bonuses")[:wisdom]
			charisma["score"] += dwarf(:racial_bonuses)[:charisma]	

		elsif race == "Halfling"
			strength["score"] += halfling(:racial_bonuses)[:strength]
			dexterity["score"] += halfling(:racial_bonuses)[:dexterity]
			charisma["score"] += halfling(:racial_bonuses)[:charisma]

		elsif race == "Gnome"
			strength["score"] += gnome(:racial_bonuses)[:strength]			
			constitution["score"] += gnome(:racial_bonuses)[:constitution]			
			charisma["score"] += gnome(:racial_bonuses)[:charisma]	

		elsif race == "halfork"	
			strength["score"] += halfork(:racial_bonuses)[:strength]
			dexterity["score"] += halfork(:racial_bonuses)[:dexterity]
			constitution["score"] += halfork(:racial_bonuses)[:constitution]
			intelligence["score"] += halfork(:racial_bonuses)[:intelligence]
			wisdom["score"] += halfork(:racial_bonuses)[:wisdom]
			charisma["score"] += halfork(:racial_bonuses)[:charisma]
		else							
		end
		ability_arry = [strength, dexterity, constitution, intelligence, wisdom, charisma]
		return ability_arry
	end

	def dwarf(choice)
		specs = { :classification => :dwarf,
		:racial_bonuses => { :strength => 0, :dexterity => 0,
					 		:constitution => 2, :intelligence => 0,
					  		:wisdom => 2, :charisma => -2 },

		:skill_bonuses => [{:skill => :perception, :value => 2},
						 {:skill => :spellcraft, :value => 2}]
				}
		return specs[choice.to_sym]						  		
	end

	def human(choice, buff = nil)
		specs = { :classification => :human,
		:racial_bonuses => { :strength => 0, :dexterity => 0,
					 		:constitution => 0, :intelligence => 0,
					  		:wisdom => 0, :charisma => 0 }
				}
		
		unless buff == nil
			specs[:racial_bonuses][buff.to_sym] = 2
		end
		return specs[choice.to_sym]	
	end

	def gnome(choice, buff = "craft")
		if buff == "craft"
				buff = :craft1
		elsif buff == "profession"
			buff == :profession
		else
			buff = :craft1
		end			

		specs = { :classification => :gnome,
		:racial_bonuses => { :strength => -2, :dexterity => 0,
					 		:constitution => 2, :intelligence => 0,
					  		:wisdom => 0, :charisma => 2 },

		:skill_bonuses => [{:skill => :perception, :value => 2},
						 {:skill => buff, :value => 2}]
				}	

		return specs[choice.to_sym]
	end

	def halfork(choice, buff = nil)
		specs = { :classification => :human||:ork,
		:racial_bonuses => { :strength => 0, :dexterity => 0,
					 		:constitution => 0, :intelligence => 0,
					  		:wisdom => 0, :charisma => 0 },

		:skill_bonuses => [{:skill => :intimidate, :value => 2},
						 {:skill => :spellcraft, :value => 2}]
				}
		unless buff == nil
			specs[:racial_bonuses][buff.to_sym] = 2
		end
		return specs[choice.to_sym]		
	end

	def halfelf(choice, buff = nil)
		specs = { :classification => :human||:elf,
		:racial_bonuses => { :strength => 0, :dexterity => 0,
					 		:constitution => 0, :intelligence => 0,
					  		:wisdom => 0, :charisma => 0 },

		:skill_bonuses => [{:skill => :perception, :value => 2}]
				}
		unless buff == nil
			specs[:racial_bonuses][buff.to_sym] = 2
		end	
		return specs[choice.to_sym]	
	end

	def halfling(choice)
		specs = { :classification => :halfling,
		:racial_bonuses => { :strength => -2, :dexterity => 2,
					 		:constitution => 0, :intelligence => 0,
					  		:wisdom => 0, :charisma => 2 },

		:skill_bonuses => [{:skill => :perception, :value => 2},
						 {:skill => :climb, :value => 2},
						{:skill => :acrobatics, :value => 2}]
				}
		return specs[choice.to_sym]
	end

	def elf(choice)
		specs = { :classification => :elf,
		:racial_bonuses => { :strength => 0, :dexterity => 2,
					 		:constitution => -2, :intelligence => 2,
					  		:wisdom => 0, :charisma => 0 },

		:skill_bonuses => [{:skill => :perception, :value => 2},
						 {:skill => :spellcraft, :value => 2}]	
				}
		return specs[choice.to_sym]
	end
end













