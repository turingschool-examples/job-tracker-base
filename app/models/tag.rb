class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :jobs, through: :taggings


  def tag_count
    Tagging.where(tag_id: self.id).map.count
  end
end
