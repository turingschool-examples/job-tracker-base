class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def count
    JobTag.where(tag: self).count
  end

  def average_salary
    jobs = JobTag.where(tag: self).select(:job_id).job_id
    Job.where(jobs).average("salary").floor
  end
end
