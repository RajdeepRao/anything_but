class UsersController < ApplicationController
  before_action :authorize, only: [:show]

    def signin
      @user = User.new
    end

    def create

    user = User.new(user_params)
    if user.save
      session[:user_id] =  user.id
      redirect_to welcome_path(user)
    else
      redirect_to root_path
    end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end

end
