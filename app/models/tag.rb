class Tag < ApplicationRecord
  belongs_to :job
  validates :text, :job, presence: true

  def count_of_jobs_with_tag
    Tag.where(text: self.text).count
  end
end
