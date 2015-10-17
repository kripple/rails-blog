class Project < ActiveRecord::Base
	has_many :tags
	
	validates :title, :description, :url, :published, :presence => true
	validates :title, :url, :uniqueness => true

	before_save :generate_slug

	private

	def generate_slug
		self.slug = self.title.parameterize
	end
end

