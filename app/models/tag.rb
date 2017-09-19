class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def avg_salary
    self.jobs.average(:salary)
  end
end
