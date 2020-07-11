class SessionsController < ApplicationController   #for verifying and serving the loggedin page to user
	def new						       
		@session = User.new
	end

	def create
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to user
		else
			flash.now[:alert] = "You entered wrong details"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been logged out of the window"
		redirect_to root_path
	end
end
