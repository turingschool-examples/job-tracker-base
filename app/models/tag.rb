
class Tag < ApplicationRecord
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def count_of_jobs
    jobs.count
  end

  def average_salary
    salaries = jobs.map do |job|
      job.salary
    end
    # byebug
    count = jobs.count
    sum = salaries.inject(0){|sum,x| sum + x }
    sum/count
  end
end
