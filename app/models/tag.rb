class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def job_count
    jobs.count
  end

  def average_job_salary_with_this_tag
    jobs.average(:salary).to_f.round
  end
end
