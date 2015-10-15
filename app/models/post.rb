class Post < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings

	validates :title, :date, :blurb, :body, :published, :presence => true
end


