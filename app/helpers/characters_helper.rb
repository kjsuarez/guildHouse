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

end
