class PostsController < ApplicationController
  before_action :redirect_unless_authorized, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_tags, only: [:new, :create, :edit, :update]
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.published.paginate(:page => params[:page])
    @unpublished = Post.unpublished.paginate(:page => params[:page])
  end

  def show
    post = Post.find_by_slug(params[:id])
    if post.published || ( !post.published && logged_in? )
      @post = post
    else
      not_found
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      @post.add_tags(params[:tag][:ids])
      redirect_to :posts
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    if @post.update_attributes(post_params) 
      @post.add_tags(params[:tag][:ids])
      redirect_to :posts
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def filter
    posts = Post.where(published: true).order(created_at: :desc)
    @posts = posts.joins(:tags).where(:tags=> {:slug=>params[:slug]})
    render :index
  end

  def destroy
    redirect_to :root and return unless request.xhr?
    @post.remove_current_taggings
    @post.destroy
    render :nothing => true
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :description, :date, :body, :published)
  end

  def find_post 
    @post = Post.find_by_slug(params[:id])
  end

  def find_tags
    @tags = Tag.all
  end
end