class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def average_salary
    jobs.average(:salary)
  end

end