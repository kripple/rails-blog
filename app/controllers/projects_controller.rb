class ProjectsController < ApplicationController
  before_action :redirect_unless_authorized, only: [:new, :create, :edit, :update]
  before_action :find_tags, only: [:new, :create, :edit, :update]

	def index
		@projects = Project.all.where(published: true).order(created_at: :desc) 
		@unpublished = Project.all.where(published: false).order(created_at: :desc)
	end

	def new
    @project = Project.new 
  end

  def create
    binding.pry
    @project = Project.create(project_params)
    if @project.save
      # @project.add_tags(params[:project][:tags])
      redirect_to :projects
    else
      flash[:errors] = @project.errors.full_messages
      render :new
    end
  end

  def edit
    find_project
  end

  def update
    binding.pry
    find_project
    if @project.update_attributes(project_params) 
      # @project.add_tags(params[:project][:tags])
      redirect_to edit_project_path(@project)
    else
      flash[:errors] = @project.errors.full_messages
      render :edit
    end
  end

	def filter
  end

	private

	def project_params
    params.require(:project).permit(:id,:title, :description, :source, :url, :published)
  end

  def find_project 
    @project = Project.find_by_slug(params[:id])
  end

  def find_tags
    @tags = Tag.all
  end
end


