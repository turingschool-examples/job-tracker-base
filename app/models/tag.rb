class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags
  
  def salary_average
    require "pry"; binding.pry
    jobs.average(:salary)
  end
end
