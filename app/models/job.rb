class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :taggings
  has_many :tags, through: :taggings

  def all_tags(title)
    self.tags = title.split(", ").map do |title|
      Tag.where(title: self.strip).find_or_create_by!
    end
  end

  def all_tags
    self.tags.map(&:title).join(", ")
  end
end
