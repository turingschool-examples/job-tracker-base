class CreateJobsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs_tags do |t|
      t.references :jobs
      t.references :tags

      t.timestamps
    end
  end
end
