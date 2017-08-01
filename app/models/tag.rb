class Tag < ApplicationRecord
  validates :title, presence: true
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags

  def self.average_salary
    jobs.salary.sum / jobs.count
  end
end
