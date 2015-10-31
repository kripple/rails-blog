class ProjectsController < ApplicationController

	def index
		@projects = Project.all.where(published: true).order(created_at: :desc) 
		@unpublished = Project.all.where(published: false).order(created_at: :desc)
	end

	def edit
		redirect_unless_authorized
		find_project
	end

	def update
		redirect_unless_authorized
		find_project
    if @project.update_attributes(project_params) 
      redirect_to :projects
    else
      flash[:errors] = @project.errors.full_messages
      render :edit
    end
	end

	def new
		redirect_unless_authorized
    @project = Project.new 
  end

  def create
  	redirect_unless_authorized
    @project = Project.create(project_params)
    if @project.save
      redirect_to :projects
    else
      flash[:errors] = @project.errors.full_messages
      render :new
    end
  end

	def filter
  end

	private

	def project_params
    params.require(:project).permit(:title, :description, :source, :url, :published)
  end

  def find_project 
    @project = Project.find_by_slug(params[:id])
  end
end


