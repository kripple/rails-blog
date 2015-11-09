class PostsController < ApplicationController
  before_action :redirect_unless_authorized, only: [:new, :create, :edit, :update]
  before_action :find_tags, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all.where(published: true).order(created_at: :desc)
    @unpublished = Post.all.where(published: false).order(created_at: :desc) 
  end

  def show
    find_post
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

  def edit
    find_post
  end 

  def update
    binding.pry
    find_post
    if @post.update_attributes(post_params) 
      # @post.add_tags(params[:post][:tags])
      redirect_to edit_post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def filter
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