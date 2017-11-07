class JobTag < ApplicationRecord
  belongs_to :job
  belongs_to :tag


  def self.count_per_job(tag_id)
    where(tag_id: tag_id).count
  end

  def self.average_salary_within_tag(tag_id)
    where(tag_id: tag_id)
    .jobs
    .pluck
  end
end
