class Post < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings

	validates :title, :date, :blurb, :body, :published, :presence => true
	validates :title, :uniqueness => true

	before_save :generate_slug

	private

	def generate_slug
		self.slug = self.title.parameterize
	end
end


