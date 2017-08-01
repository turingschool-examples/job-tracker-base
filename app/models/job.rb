class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  has_many :tags
  belongs_to :company
end
