class UsersController < ApplicationController

  before_action :authenticate_user!, only: :show

  def show
    @nickname = current_user.nickname
    @blogs = Blog.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
  end
end
