class TagJob < ApplicationRecord
  belongs_to :job
  belongs_to :tag
end
