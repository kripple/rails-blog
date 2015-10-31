class ProjectsController < ApplicationController
	before_action :authorize, only: [:show, :create]

	def index
		@projects = Project.all.where(published: true).order(created_at: :desc) 
		@unpublished = Project.all.where(published: false).order(created_at: :desc)
	end

	def show
		p = Project.find_by(slug: params[:id])
		p.published ? @project = p : @unpublished = p
	end

	def create
		@project = Project.find_by(id: params[:project][:id])
		# put check in - if source is blank, set to nil
		if @project.update_attributes(project_params) 
			redirect_to :dashboard 
		else
			flash[:errors] = @project.errors.full_messages
			redirect_to project_path(@project)
		end
	end

	def new
	end

	def filter
  end

	def update
	end

	private

	def project_params
    params.require(:project).permit(:title, :description, :source, :url, :published)
  end
end


