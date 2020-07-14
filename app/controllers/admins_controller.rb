class AdminsController< ApplicationController
	before_action :is_admin_logged
	before_action :fetch_admin, only: [:show]
	before_action :is_privilized
	def new
	end

	def show
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Admin you have successfully logged out"
		redirect_to new_admin_path
	end

	private 

	def fetch_admin
		@admin = Admin.find(params[:id])
	end

	def is_privilized
		if current_admin != @admin
			flash[:alert] = "You are not authorized to access this"
			redirect_to admin_path(current_admin)
		end
end
