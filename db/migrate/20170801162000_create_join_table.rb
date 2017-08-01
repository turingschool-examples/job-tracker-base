class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    #create_table :jobs_tags, :id => false do |t|
      #t.integer :job_id
      #t.integer :tag_id
    create_join_table :jobs, :tags do |t|
       t.index :job_id
       t.index :tag_id
       #t.integer :job_id
       #t.integer :tag_id
       #t.belongs_to :job, index: true
       #t.belongs_to :tag, index: true
    end
  end
end
