class Tag < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :job_tags
  has_many :jobs, through: :job_tags
end
