class CreateTagJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_jobs do |t|
      t.references :tag, foreign_key: true
      t.references :job, foreign_key: true
    end
  end
end
