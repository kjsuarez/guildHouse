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
  	@request = JoinGameRequest.find(params[:request_id])
  	if params[:answer] == "true"
  		puts "yo so answer was true"
		@user = User.find(@request.player_id)
		@character = Character.find(@request.character_id)
		@character.update_attribute(:game_id, @request.game_id)
		@request.destroy!
    flash[:success] = "you accepted #{@user.name}'s request"
		redirect_to "/games/#{params[:game]}"  		
  	else
  		puts "ok so answer was not true.. it was #{params[:answer]}"
  		@request.destroy!
      flash[:success] = "you declined #{@user.name}'s request"
      redirect_to "/games/#{params[:game]}" 
  	end
  end
end













