class TagsController < ApplicationController
	before_action :redirect_unless_authorized, only: [:new, :create]

  def new
  	@tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.create(tag_params)
    @tags = Tag.all
    if @tag.save
      redirect_to new_tag_path
    else
      flash[:errors] = @tag.errors.full_messages
      render :new
    end
  end

  private

	def tag_params
    params.require(:tag).permit(:id,:name)
  end
end