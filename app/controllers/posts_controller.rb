class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @pagy, @posts = pagy(Post.active_posts, items: 7)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @query = FindLikes.new(@post.id, current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
