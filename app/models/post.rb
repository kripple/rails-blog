class Post < ActiveRecord::Base
	has_many :taggings, as: :taggable
	has_many :tags, through: :taggings

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


