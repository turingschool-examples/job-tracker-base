class Tag < ActiveRecord::Base
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags
end
