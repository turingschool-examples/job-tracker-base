class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  belongs_to :job
end
