class FixTaggingsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :taggings
    create_table :taggings do |t|
      t.references :job
      t.references :tag
    end
  end
end
