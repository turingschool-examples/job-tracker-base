class Tag < ApplicationRecord
  validates :title, presence: true
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags

  def self.average_salary(tag)
    tag.jobs.average(:salary).to_f
  end
end
