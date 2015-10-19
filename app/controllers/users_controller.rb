class UsersController < ApplicationController
	def about
		@user = User.find_by(name: "Kelly")
	end

	def dashboard
		redirect_to :login unless current_user
	end

	def create
		@user = User.find_by(name: "Kelly")
		@user.update_attributes(about: user_params[:about]) if current_user
		redirect_to :dashboard
	end

	# def update
	# 	@user = User.find_by(name: "Kelly")
	# 	binding.pry
	# end

	private

	def user_params
    params.require(:user).permit(:about)
  end
end