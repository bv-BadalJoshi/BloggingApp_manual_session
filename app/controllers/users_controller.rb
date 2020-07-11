class UsersController < ApplicationController    
	def new
		@user=User.new
	end
	
	def show					#to display the logged in user page
		@user=User.find(params[:id])
	end

	def create					#for signup
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "You have successfully loggedin"
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
