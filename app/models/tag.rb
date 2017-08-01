class Tag < ApplicationRecord
  validates_presence_of :name

  has_many :taggings
  has_many :jobs, through: :taggings

  def job_count
    jobs.count
  end

  def job_salary
    jobs.average(:salary)
  end
end
