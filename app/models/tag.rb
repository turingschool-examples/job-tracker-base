class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :taggings
  has_many :jobs, through: :taggings

  def total_tagged_jobs
    jobs.size
  end

  def average_salary
    jobs.average(:salary)
  
  end

end
