class PostsController < ApplicationController

  def index
    @posts = Post.all.where(published: true).order(created_at: :desc)
    @unpublished = Post.all.where(published: false).order(created_at: :desc) 
  end

  def show
    find_post
    redirect_to edit_post_path(@post) if logged_in?
    @unpublished = @post unless @post.published
  end

  def edit
    find_post
  end 

  def update
    find_post
    if @post.update_attributes(post_params) 
      redirect_to :posts
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