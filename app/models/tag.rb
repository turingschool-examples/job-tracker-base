class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :job_tags
  has_many :jobs, through: :job_tags

  def avg_salary
    self.jobs.average(:salary).round(2)
  end

  def job_count
    JobTag.tag_count(self)
  end
end
