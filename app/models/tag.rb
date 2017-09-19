class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def count_of_jobs
    jobs.count
  end
end
