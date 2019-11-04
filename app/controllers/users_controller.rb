class UsersController < ApplicationController
  def index
    @pagy, @users = pagy(User.all, items: 10)
  end

  def show
    @user = User.find(params[:id])
  end
end
