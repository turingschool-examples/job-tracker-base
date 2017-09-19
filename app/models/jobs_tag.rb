class JobsTag < ActiveRecord::Base
  belongs_to :jobs
  belongs_to :tags
end