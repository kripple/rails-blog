class UsersController < ApplicationController
	before_action :authorize, only: [:create]

	def about
		@user = User.find_by(name: "Kelly")
	end

	def create
		@user = User.find_by(name: "Kelly")
		@user.update_attributes(about: user_params[:about]) 
		redirect_to :about
	end

	private

	def user_params
    params.require(:user).permit(:id,:about)
  end
end



