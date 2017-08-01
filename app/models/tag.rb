class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags

  def count
    self.jobs.count
  end

  def salaries
    self.jobs.reduce(0){|sum, job| sum + job.salary} / self.count
  end
end
