class Public::UsersController < ApplicationController

  def top
  end

  def about
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @spot_comments = @user.spot_comments.page(params[:page]).per(8)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:age, :name)
  end
end
