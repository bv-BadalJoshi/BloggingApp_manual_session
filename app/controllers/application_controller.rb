class ApplicationController < ActionController::Base

	helper_method :current_user , :logged_in

	def current_user
		@cur_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in
		is_logged = !!User.find(session[:user_id]) if session[:user_id];
		return !!is_logged
	end

	def is_logged
		if !logged_in
			flash[:alert] = "Hey there You need to login first"
			redirect_to login_path
		end
	end
end
