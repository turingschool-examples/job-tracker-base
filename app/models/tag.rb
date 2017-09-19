class Tag < ActiveRecord::Base
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags

  def average_salary
    jobs.average(:salary)
  end
end
