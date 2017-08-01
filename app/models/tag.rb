class Tag < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def average_salary
    self.jobs.sum(:salary) / self.jobs.count
  end
end
