class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :posts, through: :taggings

	validates :name, :presence => true
  validates :name, :uniqueness => true

  before_save :generate_slug

	private

	def generate_slug
		self.slug = self.name.parameterize
	end
end
