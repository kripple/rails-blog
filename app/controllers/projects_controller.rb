class ProjectsController < ApplicationController
	def index
		@projects = Project.all.where(published: true).order(created_at: :desc) 
	end

	def filter
  end

	def new
	end

	def create
	end

	def update
	end
end


