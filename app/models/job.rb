class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :taggings
  has_many :tags, through: :taggings

  scope :average_salary, -> { average(:salary).to_i }
end
