class Tag < ApplicationRecord
  has_many :jobs, through: :taggings
  has_many :taggings

  def job_count
    jobs.length
  end

  def average_salary
    jobs.average(:salary).to_i
  end
end
