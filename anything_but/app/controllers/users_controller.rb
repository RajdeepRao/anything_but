class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      session[:user_id] =  @user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def show

  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.delete
    redirect_to '/signout'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user=current_user
  end

end
