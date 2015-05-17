module CharactersHelper

	def json_to_score(string)
		ActiveSupport::JSON.decode(string)
	end

end
