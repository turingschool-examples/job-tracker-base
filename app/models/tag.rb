class Tag < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def average_salary
    jobs.average(:salary)
  end

end