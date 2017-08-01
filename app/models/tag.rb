class Tag < ApplicationRecord
  has_many :jobs, through: :taggings
  has_many :taggings
end
