class Tag < ApplicationRecord
  has_and_belongs_to_many :jobs
  validates :name, presence: true, uniqueness: true

  def average_job_salary
    self.jobs.average(:salary)
  end
end
