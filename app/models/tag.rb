class Tag < ApplicationRecord
  has_many :job_tags
  has_many :tags, through: :job_tags
  
end
