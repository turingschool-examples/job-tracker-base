class Tag < ApplicationRecord
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags

  def jobs_with_same_tag
    Tag.where(name: self.name).count
  end

end
