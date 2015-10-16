class Project < ActiveRecord::Base
	validates :title, :description, :url, :published, :presence => true
	validates :title, :url, :uniqueness => true
end

