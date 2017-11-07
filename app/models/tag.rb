class Tag < ApplicationRecord
  has_many :jobtags
  has_many :jobs, through: :jobtags
end
