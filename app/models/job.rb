class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many   :comments

  def self.by_interest
    group(:level_of_interest).order("count(*) DESC").count
  end

  def self.by_location
    group(:city).order("count(*) DESC").count
  end

end
