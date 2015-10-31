class PostsController < ApplicationController

  before_action :find_post, only: [:show,:edit,:update]

  def index
    @posts = Post.all.where(published: true).order(created_at: :desc)
    @unpublished = Post.all.where(published: false).order(created_at: :desc) 
  end

  def show
    redirect_to edit_post_path(@post) if logged_in?
    @unpublished = @post unless @post.published
  end

  def edit
  end 

  def update
    if @post.update_attributes(post_params) 
      redirect_to :dashboard 
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  # def create
  #   @post = Post.find_by(id: params[:post][:id])
  #   if @post.update_attributes(post_params) 
  #     redirect_to :dashboard 
  #   else
  #     flash[:errors] = @post.errors.full_messages
  #     redirect_to post_path(@post)
  #   end
  # end

  def filter
  end

  def new
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :date, :body, :published)
  end

  def find_post 
    @post = Post.find_by_slug(params[:id])
  end
end