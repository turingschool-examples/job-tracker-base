class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

#  def average_salary
 #   self.jobs.map do |job|
  #    job.salary.map do |salary|
   #     salary.inject{ |sum, el| sum + el }.to_f / job.size
    #  end
     #end
  #
  #end

  def average_salary
    self.jobs.each do |job|
      job.salary.all
  end
  end

  def job_count
    self.jobs.group(:job_id).count
  end
end
