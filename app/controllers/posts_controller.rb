class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.where(status: 1, user_id: current_user.id).paginate(page: params[:page], per_page: 5)  
    # @posts = Post.all.where(status: 1)
    # @posts = Post.all.order('created_at DESC')
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "Post #{@post.id} successfully created."
    else 
      flash.now[:alert] = 'Post was not created.'
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post #{@post.id} successfully updated."
    else
      flash[:alert] = 'Post was not updated.'
      redirect_to edit_post_path
    end
  end
  
  # Soft Delete
  def destroy
    @post.soft_delete
    redirect_to posts_path, notice: "Post #{@post.id} was successfully deleted."
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
