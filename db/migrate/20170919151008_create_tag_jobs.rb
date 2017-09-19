class CreateTagJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_jobs do |t|
      t.references :job, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
