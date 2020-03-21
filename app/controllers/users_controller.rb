class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:succes] = "Sign Up Success"
      redirect_to root_path
    else
      flash[:succes] = "Registration Failed"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :email, :fullname, :password
  end
end
