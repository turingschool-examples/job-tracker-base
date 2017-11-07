class Tag < ApplicationRecord
  validates :name, presence: true
  
  has_many :tag_jobs
  has_many :jobs, through: :tag_jobs

  def count_of_jobs
    jobs.count
  end

  def average_salary
    jobs.average(:salary)
  end
  
end