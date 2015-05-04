class UsersController < ApplicationController

#before_action :logged_in_user, only: [:edit, :destroy, :index, :show]
before_action :correct_user, only: [:show]

########################### standard actions 
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])					
	end

	def new
		@user = User.new
		puts @user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in(@user)
			redirect_to @user
		else
			flash[:danger] = "something went wrong"
			render 'new'
		end
	end



	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
      		flash[:success] = "Profile updated"	
      		redirect_to @user		
		else
      		flash[:error] = "failed"	
      		redirect_to @user
		end
	end

	def destroy
		
	end
#####################
	def user_params # selected attributes of user object passed as a hash
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

	def logged_in_user

	end

	def correct_user
		@user = User.find(params[:id])		
    	
		if current_user != @user
			redirect_to(root_url)
			flash[:danger] = "you can only view/edit your own profile"				
		end
	end



end
