class UserSessionsController < ApplicationController
  def new
    redirect_to :dashboard and return if logged_in?
  	@user = User.new
    render layout: !request.xhr?
  end

  def create
  	user = User.find_by(name: "Kelly")     
		if user 
      if user.authenticate(user_session_params[:password])
		    login_user(user)
      else
        flash[:login_error] = "Wrong"
      end
    end
    redirect_to :root
  end

  def destroy
  	logout_user
    redirect_to :root
  end

  private

  def user_session_params
    params.require(:user_session).permit(:id,:password)
  end
end







    