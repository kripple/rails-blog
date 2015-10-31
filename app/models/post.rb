class Post < ActiveRecord::Base
	has_many :taggings, as: :taggable
	has_many :tags, through: :taggings

	validates :title, :date, :description, :body, :presence => true
	validates :title, :uniqueness => true

	before_save :generate_slug

	def to_param
    slug
  end

  def tags_list
  	self.tags.each_with_object("") { |obj,elem| elem << obj.name << ", " }.chomp(", ")
  end

	private

	def generate_slug
		self.slug = self.title.parameterize
	end
end


