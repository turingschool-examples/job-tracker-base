class Tag < ApplicationRecord

  has_and_belongs_to_many :jobs

  def job_count
    jobs.count
  end

  def average_salary
    jobs.average(:salary).round(2)
  end
end
