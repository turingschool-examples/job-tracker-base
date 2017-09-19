class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :jobs, through: :taggings

  def count
    jobs.count
  end
end
