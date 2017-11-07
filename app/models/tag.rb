class Tag < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :jobs

  def job_count
    jobs.count
  end

  def mean_salary
    jobs.average(:salary).to_i
  end

end
