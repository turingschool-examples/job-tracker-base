class CreateJobTags < ActiveRecord::Migration[5.0]
  def change
    create_table :job_tags do |t|
      t.belongs_to :jobs
      t.belongs_to :tags

      t.timestamps
    end
  end
end
