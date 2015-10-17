class Tag < ActiveRecord::Base
	belongs_to :post
	belongs_to :project

	validates :name, :presence => true
  validates :name, :uniqueness => true

  before_save :generate_slug

	private

	def generate_slug
		self.slug = self.name.parameterize
	end
end


