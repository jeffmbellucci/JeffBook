module SessionsHelper
  
  def login(user)
    session[:session_token] = user.create_session_token
    flash[:token] = "#{session[:session_token]}  is the session token"
    self.current_user = user
  end
  
  def log_out
    session[:session_token] = nil
    # current_user.session_token = nil
    current_user = nil
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user?(user)
    current_user == user
  end
  
  def logged_in?
    !!current_user
  end
  
  def signed_in_user
    if !logged_in?
      flash[:notice] = "Please sign in."
      redirect_to new_sessions_url
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:notices] = "You are not allowed to do that."
      redirect_to new_sessions_url unless logged_in?
      redirect_to current_user if logged_in?
    end
  end
  
end
