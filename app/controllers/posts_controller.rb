class PostsController < ApplicationController
  def index
    @posts = Post.all.where(published: true).order(created_at: :desc)
    @unpublished = Post.all.where(published: false).order(created_at: :desc) 
  end

  def show
    p = Post.find_by_slug(params[:id])
    p.published ? @post = p : @unpublished = p
    redirect_to edit_post_path(p) if logged_in?
  end

  def edit
    @post = Post.find_by_slug(params[:id])
  end 

  def update
    @post = Post.find_by(id: params[:post][:id])
    if @post.update_attributes(post_params) 
      redirect_to :dashboard 
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to post_path(@post)
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
end