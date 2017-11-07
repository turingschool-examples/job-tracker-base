class Tag < ApplicationRecord
  has_many :jobs
  has_many :jobs, through: :jobs_tags
end
