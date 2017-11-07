class CreateJobTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobs, :tags do |t|
      t.index [:job_id, :tag_id], unique: true
    end
  end
end
