class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :jobs_tag
  has_many :tags, through: :jobs_tag

  # def job_with_tag(tag)
  #   Job.where("tags.name = #{tag}")  #this was in progress during refactor
  # end

  def average_salary(tag)               #this was also in the process of refactor
    jobs = Job.where(Job.tags.name = tag)
    count = 0
    total = 0
    jobs.each do |job|
      total << job.salary
      count += 1
    end
    total / count
  end

end
