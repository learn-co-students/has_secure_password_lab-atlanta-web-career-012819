class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end

  def welcome
    @user = User.find(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
