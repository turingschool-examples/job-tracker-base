class Tag < ApplicationRecord
  has_many :jobs, through: :taggings
  has_many :taggings

  def job_count
    jobs.length
  end
end
