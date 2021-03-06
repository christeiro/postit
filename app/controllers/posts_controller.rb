class PostsController < ApplicationController
  before_action :post_params, only: [:create, :update]
  before_action :set_post, only: [:show, :edit, :update]

  def index
  	@post = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first
    if @post.save
      flash[:notice] = "Post was created!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated!"
      redirect_to root_path
    else
      render :edit
    end 
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
