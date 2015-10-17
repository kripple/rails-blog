class PostsController < ApplicationController
  def index
    @posts = Post.all.where(published: true).order(created_at: :desc) 
  end

  def new
  end

  def show
    p = Post.find_by_slug(params[:id])
    p.published ? @post = p : not_found
  end

  def create
  end

  def update
  end

  def destroy
  end
end