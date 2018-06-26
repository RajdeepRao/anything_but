class SessionsController < ApplicationController

  def new
  end

  def create
    #binding.pry
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
