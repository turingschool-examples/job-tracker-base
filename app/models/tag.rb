class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

end
