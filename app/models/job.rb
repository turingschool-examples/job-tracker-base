class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :jobs_tags
  has_many :tags, through: :jobs_tags
  helper_method :count_tags
  
  def self.count_tags
    tags.count
  end
end
