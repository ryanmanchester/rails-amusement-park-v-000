class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    #byebug
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] =  "Invalid Username and/or Password"
      redirect_to signin_path
    end
  end

  
end
