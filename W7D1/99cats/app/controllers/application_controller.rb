class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_taken] = user.reset_session_token!
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to cats_url if logged_in?
  end

  def logged_in?
    !!current_user
  end

  def logout!
    if logged_in?
      current_user.reset_session_token!
    end
    session[:session_token] = nil
    @current_user = nil
  end

end
