class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :jobtags
  has_many :tags, through: :jobtags
end
