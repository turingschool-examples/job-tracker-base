class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :job_tags
  has_many :jobs, through: :job_tags


  def average_salary
    jobs.average(:salary).round
  end
end
