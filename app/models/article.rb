class Article < ApplicationRecord
  validates_presence_of :title, :body
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    tags.map(&:name).join(', ')
  end
# tag_list= simulates an attribute within article.
# When article_params is passed in to Article.new
# within the controller, tag_list can now be processed
# and outputs clean tags without spaces or duplicates.
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").map{ |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
