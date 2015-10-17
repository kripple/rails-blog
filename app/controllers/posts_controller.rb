class PostsController < ApplicationController
  def index
    @posts = Post.all # order by created at date
  end

  def new
  end

  def show
    binding.pry
    @post = Post.find_by_slug()
  end

  def create
  end

  def update
  end

  def destroy
  end
end