class JobTag < ApplicationRecord
  belongs_to :job
  belongs_to :tag


  def self.tag_count(tag)
    self.where(tag_id: tag).count
  end
end
