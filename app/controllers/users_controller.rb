class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]

  def show
    @nickname = @user.nickname
    @posts = @user.posts
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
