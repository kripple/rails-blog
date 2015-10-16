class UserSessionsController < ApplicationController
  def new
  	@user = User.new
  	render 'new', layout: false
  end

  def create
  	user = User.find_by(name: "Kelly")
		if user && user.authenticate(user_session_params[:password])
		  login_user(user)
		end
		redirect_to root_url
  end

  def destroy
  	logout_user
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:password)
  end
end







    