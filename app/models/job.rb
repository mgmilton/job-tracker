class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many   :comments
  has_many   :taggings, dependent: :destroy
  has_many   :tags, through: :taggings

  def self.by_interest
    group(:level_of_interest).order("count(*) DESC").count
  end

  def self.by_location
    group(:city).order("count(*) DESC").count
  end

  def tag_list
    self.tags.collect do |tag|
      tag.title
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_titles= tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_titles.collect {|title| Tag.find_or_create_by(title: title)}
    self.tags = new_or_found_tags
  end

end
