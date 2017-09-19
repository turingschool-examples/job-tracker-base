class CreateJobsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs_tags do |t|
      t.references :job, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
