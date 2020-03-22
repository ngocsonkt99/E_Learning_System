# frozen_string_literal: true

module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
 end

  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find(user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find(user_id)
      if user&.authenticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
 end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
