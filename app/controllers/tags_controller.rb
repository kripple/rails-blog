class TagsController < ApplicationController
	before_action :redirect_unless_authorized, only: [:new, :create]

  def new
  	@tag = Tag.new
  end

  def create
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