class UsersController < ApplicationController
	def about
		@about = User.find_by(name: "Kelly").about 
	end

	def dashboard
		authorize_user
		render "/users/dashboard"
	end

	private

  def authorize_user
    redirect_to :login unless current_user
  end
end