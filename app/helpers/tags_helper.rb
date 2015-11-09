module TagsHelper
	def taggable_type
		"#{self.class.name.downcase}"
	end

	def filter_path
		self.taggable_type + "s/filter"
	end

	def tags_list
  	self.tags.each_with_object("") { |obj,elem| elem << obj.name << ", " }.chomp(", ")
  end

  # def add_tag(name)
    
  # end

  def add_tags(list)
  	list.split(/ *, */).each do |tag_name|
  		tag = Tag.find_by(name: tag_name) || Tag.create(name: tag_name)
  		self.tags << tag unless self.tags.any? { |t| t.name == tag_name }
  	end
  end
end