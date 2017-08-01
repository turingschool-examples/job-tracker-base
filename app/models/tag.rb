class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def count
    JobTag.where(tag: self).count
  end

  def average_salary
    JobTag.joins(:job).where(tag: self).average("salary").floor
  end
end
