class UserSessionsController < ApplicationController
  def new
    redirect_to :dashboard and return if logged_in?
  	@user = User.new
  end

  def create
  	user = User.find_by(name: "Kelly")
		if user && user.authenticate(user_session_params[:password])
		  login_user(user)
		else
      flash[:error] = "Wrong."
    end
    redirect_to :login
  end

  def destroy
  	logout_user
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:id,:password)
  end
end







    