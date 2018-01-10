class Tag < ApplicationRecord
  validates_presence_of :name
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def count_jobs
    jobs.count
  end

  def average_salary
    jobs.average(:salary)
  end
end
