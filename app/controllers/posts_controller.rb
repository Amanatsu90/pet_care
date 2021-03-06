class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = if params[:theme_id]
               Post.where(theme_id: params[:theme_id])
             elsif params[:dog_size_id]
               Post.where(dog_size_id: params[:dog_size_id])
             elsif params[:tag_name]
               Post.tagged_with(params[:tag_name].to_s).all
             else
               Post.order(created_at: :DESC)
             end
  end

  def new
    @post = Post.new
    render :index unless user_signed_in?
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    redirect_to root_path unless current_user.id == @post.user.id
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @post.user.id
      @post.destroy
      redirect_to root_path
    end
  end

  def search
    @posts = Post.search(params[:keyword]).order(created_at: :DESC)
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @posts = Post.find(favorites)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :dog_size_id, :theme_id, :image,
                                 :tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
