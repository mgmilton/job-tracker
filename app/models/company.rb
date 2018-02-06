class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three
    select("companies.name, avg(level_of_interest) as avg")
    .joins(:jobs)
    .group(:name)
    .order("avg DESC")
    .limit(3)
  end

  def self.avg_job_interest(name)
    find_by(name: name).jobs.average(:level_of_interest)
  end

end
