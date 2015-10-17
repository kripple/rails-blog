class Tag < ActiveRecord::Base
	# attr_accessor :slug

	belongs_to :post
	belongs_to :project

	validates :name, :presence => true
  validates :name, :uniqueness => true

  before_save :generate_slug

	def to_param
    slug
  end

	private

	def generate_slug
		self.slug = self.name.parameterize
	end
end


