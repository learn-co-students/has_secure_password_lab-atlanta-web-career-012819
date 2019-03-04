class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to '/sessions/new' unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
  end
  
end
