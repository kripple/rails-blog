module TagsHelper
	def taggable_type
		"#{self.class.name.downcase}"
	end

	def filter_path
		self.taggable_type + "s/filter"
	end

	
  

  def add_tags(array)
    remove_current_taggings
    array.split(",").each { |id| self.tags << Tag.find_by(id: id) }
  end

  private

  def remove_current_taggings
    self.taggings.destroy_all
  end
end