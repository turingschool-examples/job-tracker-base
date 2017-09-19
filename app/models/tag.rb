class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags
  
  def salary_average
    jobs.average(:salary)
  end
end
