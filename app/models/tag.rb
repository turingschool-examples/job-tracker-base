class Tag < ApplicationRecord
  belongs_to :job
  has_many :job_tags
  has_many :jobs, through: :job_tags
    validates :text, presence: true

  def count_of_jobs_with_tag
    JobTag
    .where(tag_id: self.id)
    .count
  end

  def average_salary_for_jobs_with_tag
    Tag
    .joins(:job_tags)
    .joins(:jobs)
    .average(:salary)
  end
end
