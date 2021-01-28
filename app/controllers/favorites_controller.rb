class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    if current_user.id != @post.user_id
      @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    if current_user.id = @favorite.user_id
      @favorite.destroy
      redirect_to post_path(@post.id)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
