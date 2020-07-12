class PagesController < ApplicationController
	before_action :is_user_logged_in
	def home
		
	end
	
	private 
	
	def is_user_logged_in
		redirect_to user_path(current_user) if !!current_user
	end
end
