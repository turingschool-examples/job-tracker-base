class Tag < ActiveRecord::Base
  validates :title, presence: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def self.count
    group(:title).order(:title)
  end
end
