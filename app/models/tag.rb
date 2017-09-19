class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :jobs_tags
  has_many :jobs, through: :jobs


end