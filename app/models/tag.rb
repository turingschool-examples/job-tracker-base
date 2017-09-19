class Tag < ActiveRecord::Base
  validates :title, presence: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def average
    sum = 0
    jobs.each do |job|
      sum += job.salary
    end
    sum/jobs.count
  end

end
