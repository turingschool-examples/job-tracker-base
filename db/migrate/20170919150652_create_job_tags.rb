class CreateJobTags < ActiveRecord::Migration[5.0]
  def change
    create_table :job_tags do |t|
      t.belongs_to :job
      t.belongs_to :tag

      t.timestamps
    end
  end
end
