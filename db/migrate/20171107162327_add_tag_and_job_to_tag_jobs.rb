class AddTagAndJobToTagJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :tag_jobs, :tag, foreign_key: true
    add_reference :tag_jobs, :job, foreign_key: true
  end
end
