class SessionsController < ApplicationController
	def new
		
	end

	def create
		puts "login submitted"
		submitted_email = params[:session][:email]
		@user = User.find_by(email: submitted_email)
		
		if @user && @user.authenticate(params[:session][:password])
			log_in @user
			redirect_to @user			
		else
			flash.now[:notice] = 'Invalid email/password combination'
			render 'new'
		end
	end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end	

end
