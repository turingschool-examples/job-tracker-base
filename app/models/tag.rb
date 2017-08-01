class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :job_tags
  has_many :jobs, through: :job_tags

  def total_jobs
    jobs.count
  end
end
