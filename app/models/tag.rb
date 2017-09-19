class Tag < ApplicationRecord
  belongs_to :job
  validates :text, :job, presence: true
  validates_uniqueness_of :text, :scope => :job

  def count_of_jobs_with_tag
    Tag.where(text: self.text).count
  end

  def average_salary_for_jobs_with_tag
    Tag.where(text: self.text).joins(:job).average(:salary)
  end
end
