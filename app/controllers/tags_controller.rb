class TagsController < ApplicationController
  def new
  	redirect_unless_authorized
  	@tag = Tag.new
  end

  def create
  	redirect_unless_authorized
    @tag = Tag.create(tag_params)
    if @tag.save
      redirect_to :dashboard
    else
      flash[:errors] = @tag.errors.full_messages
      render :new
    end
  end

  private

	def tag_params
    params.require(:tag).permit(:name)
  end
end