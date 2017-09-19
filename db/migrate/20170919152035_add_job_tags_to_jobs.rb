class AddJobTagsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :job_tag, foreign_key: true
  end
end
