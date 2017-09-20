class RemoveJobsFromTags < ActiveRecord::Migration[5.0]
  def change
     remove_reference :tags, :jobs, index: true
  end
end
