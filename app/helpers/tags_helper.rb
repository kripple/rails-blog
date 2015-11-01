module TagsHelper
	def taggable_type
		"#{self.class.name.downcase}"
	end

	def filter_path(taggable)
		"#{self.taggable_type}s/filter"
	end

	def tags_list
  	self.tags.each_with_object("") { |obj,elem| elem << obj.name << ", " }.chomp(", ")
  end

  def add_tags(list)
  	list.split(/, ?/).each do |tag_name|
  		# remove spaces from before / after tags (use a better regex)
  		tag = Tag.find_by(name: tag_name) || Tag.create(name: tag_name)
  		binding.pry
  		Tagging.create(tag: tag, taggable_type: taggable_type(self), taggable_id: self.id)
  	end
  end
end