class UsersController < ApplicationController
	before_action :redirect_unless_authorized, only: [:update]

	def about
		@user = User.find_by(name: "Kelly")
	end

	def update
		@user = User.find_by(name: "Kelly")
		if @user.update_attributes(about: user_params[:about]) 
			redirect_to :root
		else
			render :about
		end
	end

	private

	def user_params
    params.require(:user).permit(:id,:about)
  end
end



