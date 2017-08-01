class CreateTagging < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :jobs, foreign_key: true
      t.references :tags, foreign_key: true

      t.timestamps
    end
  end
end
