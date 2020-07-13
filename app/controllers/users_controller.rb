class UsersController < ApplicationController
    
	before_action :find_user, only: [:show]
	before_action :user_privilezed, only: [:show]

	def new
	end

	def show					#to display the logged in user page		
	end

	def create					#for signup
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "You have successfully loggedin"
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash.now[:alert] = @user.errors.full_messages
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
	
	def find_user
		@user=User.find(params[:id])
	end

	def user_privilezed
		if !current_user.admin && @user != current_user
			flash[:alert] = "You don't have the authorities to access the page"
			redirect_to articles_path
		end
	end

end
