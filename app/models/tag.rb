class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def job_count
    jobs.count
  end

  def avg_job_salary
    jobs.average(:salary)
  end
  
end
