class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  has_and_belongs_to_many :tags
end
