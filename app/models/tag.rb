class Tag < ActiveRecord::Base
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags


  has_many :machines_snacks
has_many :machines, through: :machines_snacks
end
