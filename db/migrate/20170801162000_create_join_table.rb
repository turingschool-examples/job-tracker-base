class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobs, :tags do |t|
       #t.index [:job_id, :tag_id]
       #t.index [:tag_id, :job_id]
       t.integer :job_id
       t.integer :tag_id
    end
  end
end
