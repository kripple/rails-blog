class UsersController < ApplicationController
	def about
		@about = User.find_by(name: "Kelly").about 
	end

	def dashboard
		redirect_to :login unless current_user
	end
end