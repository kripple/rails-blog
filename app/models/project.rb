class Project < ActiveRecord::Base
	include TagsHelper
	
	has_many :taggings, as: :taggable
	has_many :tags, through: :taggings
	
	validates :title, :description, :url, :date, :presence => true
	validates :title, :url, :uniqueness => true

	before_save :generate_slug

	self.per_page = 10

	def to_param
    slug
  end

	private

	def generate_slug
		self.slug = self.title.parameterize
	end
end



