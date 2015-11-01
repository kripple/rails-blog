module TagsHelper
	def filter_path(taggable)
		"#{taggable.taggings.first.taggable_type.downcase}s/filter"
	end

	def tags_list
  	self.tags.each_with_object("") { |obj,elem| elem << obj.name << ", " }.chomp(", ")
  end
end