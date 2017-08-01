class Tag < ApplicationRecord
  has_many :jobs, through: :taggings
  has_many :taggings

  def job_count
    jobs.length
  end

  def average_salary
    jobs.each do |job, sum|
      (sum += job.salary) / job_count
  end
  sum
end
