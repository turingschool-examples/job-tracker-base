class Tag < ApplicationRecord
  has_many :taggings
  has_many :jobs, through: :taggings

  def job_count
    self.jobs.count
  end

  def average_salary
    self.jobs.average("salary")
  end
end
