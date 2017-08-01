class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :job_tags
  has_many :jobs, through: :job_tags

  def self.average_salary(job)
    self.joins(:jobs).where(id: job).average(:salary)
  end

  def self.avg_salaray

  end
end
