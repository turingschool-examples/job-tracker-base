class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :jobs_tag
  has_many :tags, through: :jobs_tag
end
