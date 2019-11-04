class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    user_id = params[:user_id]
    post_id = params[:post_id]
    @like = Like.new
    @like.post_id = post_id
    @like.user_id = user_id
    if @like.save
      #redirect_to :back
      redirect_to posts_path(page: params[:page])
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path(page: params[:page])
    #redirect_to :back
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
