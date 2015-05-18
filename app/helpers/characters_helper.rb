module CharactersHelper

	def json_to_hash(string)
		ActiveSupport::JSON.decode(string)
	end

		def set_score(score,mod)
		x = {:score => score, :mod => mod}
	end

end
