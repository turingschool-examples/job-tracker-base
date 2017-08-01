class Tag < ApplicationRecord
  has_many :taggings
  has_many :jobs, through: :taggings

  def average_salary
    jobs.average(:salary).to_i
  end

  def job_count
    jobs.count
  end
end
