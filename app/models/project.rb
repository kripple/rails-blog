class Project < ActiveRecord::Base
	# attr_accessible :slug

	has_many :tags
	
	validates :title, :description, :url, :published, :presence => true
	validates :title, :url, :uniqueness => true

	before_save :generate_slug

	def to_param
    slug
  end

	private

	def generate_slug
		self.slug = self.title.parameterize
	end
end



