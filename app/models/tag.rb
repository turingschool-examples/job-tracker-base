class Tag < ApplicationRecord
  has_many :tag_jobs
  has_many :jobs, through: :tag_jobs

  def average_salary
    jobs.average(:salary)
  end

end
