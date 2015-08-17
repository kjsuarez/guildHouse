module CharactersHelper
	
	def to_json(hash)
		ActiveSupport::JSON.encode(hash)
	end

	def json_to_hash(string)
		ActiveSupport::JSON.decode(string)
	end

		def set_score(score,mod)
		x = {:score => score, :mod => mod}
	end

	def score_to_mod(score)  	# the formula that derives ability
		modifier = (score/2)-5 	# modifier from ability score
		return modifier
	end
	
end
