class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def show
    render json: @blog
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      render json: @blog, status: :created, location: @blog
    else
      render json: {errors: @blog.errors.full_messages}
    end
  end

  def update
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: {errors: @blog.errors.full_messages}
    end
  end

  def destroy
    @blog.destroy
    render json: @blog
  end

  private
    def set_blog
      @blog = Blog.find_by_id(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :author, :content, :likes)
    end
end
