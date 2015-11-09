module TagsHelper
  def filter_url(tag)
    "/#{self.class.name.downcase}s/filter/#{tag.slug}"
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