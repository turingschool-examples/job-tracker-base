class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def avg_salary
    Tag.where(title: self.title).joins(:jobs).average(:salary)
  end
end
