class Project < ActiveRecord::Base
	include TaggablesHelper
	
	has_many :taggings, as: :taggable
	has_many :tags, through: :taggings
	
	validates :title, :description, :url, :date, :presence => true
	validates :title, :url, :uniqueness => true

	before_save :generate_slug

	self.per_page = 6

	def self.published
    self.where(published: true).order(created_at: :desc)
  end

  def self.unpublished
    self.where(published: false).order(created_at: :desc)
  end

	def to_param
    slug
  end

	private

	def generate_slug
		self.slug = self.title.parameterize
	end
end



