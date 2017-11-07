class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_and_belongs_to_many :jobs

  def jobs_with_tag
    jobs.count
  end

  def average_salary
    jobs.average(:salary)
  end
end
