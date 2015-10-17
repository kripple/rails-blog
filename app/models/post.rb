class Post < ActiveRecord::Base
	# attr_accessible :slug

	has_many :tags

	validates :title, :date, :description, :body, :published, :presence => true
	validates :title, :uniqueness => true

	before_save :generate_slug

	def to_param
    slug
  end

	private

	def generate_slug
		self.slug = self.title.parameterize
	end
end


