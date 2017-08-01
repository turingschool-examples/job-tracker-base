class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  has_many :job_tags
  has_many :tags, through: :job_tags


  def self.average_salary(tag)
    self.joins(:tags).where(id: tag).average(:salary)
  end
end
