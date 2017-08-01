class CreateJobTags < ActiveRecord::Migration[5.0]
  def change
    create_table :job_tags do |t|
      t.references :job
      t.references :tag

      t.timestamps
    end
  end
end
