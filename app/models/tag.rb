class Tag < ApplicationRecord

  has_many :job_tags
  has_many :jobs, through: :job_tags

  def job_count
    jobs.count
  end

  def avg_salary
    jobs_with_salary = jobs.where.not(salary: nil).count
    jobs.total_salary / jobs_with_salary
  end

end
