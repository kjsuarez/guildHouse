class JoinGameRequestsController < ApplicationController
  def send_request
  	@request = JoinGameRequest.new
  	@request.player_id = params[:player]
  	@request.master_id = params[:master]
  	@request.character_id = params[:character] 
  	@request.game_id = params[:game]  	 	
  	@request.save
  	redirect_to "/games/#{params[:game]}"  	
  end

  def answer_request
  end
end
