class Tag < ActiveRecord::Base
  has_many :job_tags
  has_many :jobs, through: :job_tags
  validates :name, presence: true, uniqueness: true

  def count
    jobs.count
  end

  def average_salary
    jobs.average(:salary).to_i
  end
end
