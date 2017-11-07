class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :tags

  def self.total_tagged_jobs(tag)
    where(tag_id: tag.id).count
  end

end
