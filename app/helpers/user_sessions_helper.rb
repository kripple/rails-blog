module UserSessionsHelper
  def login_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout_user
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_unless_authorized
    redirect_to :root and return unless current_user
  end
end