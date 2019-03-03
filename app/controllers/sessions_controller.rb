class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    return redirect_to signup_path unless @user
    if @user.authenticate(params[:user][:password])
      # binding.pry
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:alert] = "Username/Password incorrect"
      redirect_to login_path
    end
  end
end
