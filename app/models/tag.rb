class Tag < ApplicationRecord
  validates :title, presence: true
  has_many :taggings, dependent: :destroy
  has_many :jobs, through: :taggings

  def to_s
    title
  end
end
