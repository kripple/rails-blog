module TagsHelper
	def filter_path(taggable)
		"#{taggable.taggings.first.taggable_type.downcase}s/filter"
	end
end