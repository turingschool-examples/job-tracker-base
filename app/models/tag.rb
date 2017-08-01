class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def job_count
    Tag.find(self.id).jobs.count
  end

  def avg_salary
    Tag.find(self.id).jobs.average(:salary)
  end
end
