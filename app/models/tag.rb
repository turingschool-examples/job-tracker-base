class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :jobs, through: :taggings

  def count
    jobs.count
  end

  def average_salary
    jobs.average(:salary).to_i
  end
end
