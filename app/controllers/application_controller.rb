class ApplicationController < ActionController::Base

	helper_method :current_user , :logged_in

	def current_user
		@cur_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in
		cur = User.find(session[:user_id]) if session[:user_id]
		return !!cur
	end
end
