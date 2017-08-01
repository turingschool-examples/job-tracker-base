class Tagging < ApplicationRecord
  belongs_to :jobs
  belongs_to :tags

end
