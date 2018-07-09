class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    # @posts = Post.all.order('created_at DESC')
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(secure_params)
    if @post.save
      redirect_to posts_path, notice: "Post successfully created"
    else 
      render :new, alert: "Post was not created"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update(secure_params)
      redirect_to @post, notice: 'Post was successfully updated'
    else 
      render :new, alert: "Post was not updated"
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted'
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  private
  def secure_params
    params.require(:post).permit(:title, :body)
  end
end
