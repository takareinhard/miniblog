class BlogsController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end
  
  def create
    Blog.create(blog_params)
    redirect_to controller: :blogs, action: :index
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
    redirect_to controller: :blogs, action: :index
  end

  private
  def blog_params
    params.require(:blog).permit(:text, :image).merge(user_id: current_user.id)
  end
  
end