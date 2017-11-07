class Tag < ApplicationRecord
  has_many :jobs
  has_many :jobs, through: :companies_tags
end
