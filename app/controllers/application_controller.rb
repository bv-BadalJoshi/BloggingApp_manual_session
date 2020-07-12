class ApplicationController < ActionController::Base
	helper_method :current_user 
	before_action :current_user
	before_action :is_logged, only: [:update, :edit, :destroy, :show]

	private

	def current_user
		@cur_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def is_logged
		if !(!!current_user)
			flash[:alert] = "Hey there You need to login first"
			redirect_to login_path
		end
	end
end
