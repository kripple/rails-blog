class UsersController < ApplicationController
	before_action :authorize, only: [:create]

	def about
		@user = User.find_by(name: "Kelly")
	end

	def dashboard
		redirect_to :login unless current_user
	end

	def create
		@user = User.find_by(name: "Kelly")
		if @user.update_attributes(about: user_params[:about]) 
			redirect_to :dashboard
		else
			redirect_to :root
		end
	end

	private

	def user_params
    params.require(:user).permit(:about)
  end
end



