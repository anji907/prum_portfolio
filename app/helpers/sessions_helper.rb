module SessionsHelper

  # ログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # ログアウトする
  def log_out
    reset_session
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
     !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent.encrypted[:remember_token] = user.remember_token
  end
end
