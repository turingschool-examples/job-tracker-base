class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  has_many :job_tags
  has_many :tags, through: :job_tags

  def avg_salary
    avg = 0
    tags = JobTag.where(job_id: self.id)
    tags.each do |tag|
      avg += tag.job.salary
    end
    avg / tags.count
  end
end
