class Tag < ApplicationRecord
  validates :title, presence: true

  has_many   :tag_jobs
  has_many   :jobs, through: :tag_jobs
end