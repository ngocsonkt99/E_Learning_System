class SessionsController < ApplicationController
  def new;
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "login success"
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = "In Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out if signed_in?
    flash[:success] = "You are logged out"
    redirect_to users_sign_in_path
  end
end
