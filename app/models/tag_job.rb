class TagJob < ApplicationRecord
  belongs_to :tag
  belongs_to :job
end