class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    if current_user.id != @post.user_id
      @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
      redirect_to post_path(@post.id)
    end
  end

end
