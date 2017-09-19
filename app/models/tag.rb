class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def count
    self.jobs.count
  end

  def average_salary
    self.jobs.average(:salary).to_i
  end

end
