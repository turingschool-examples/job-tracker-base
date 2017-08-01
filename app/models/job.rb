class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :taggings
  has_many :tags, through: :taggings

  def all_tags=(titles)
    self.tags = titles.split(", ").map do |title|
      Tag.where(title: title.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:title).join(", ")
  end
end
