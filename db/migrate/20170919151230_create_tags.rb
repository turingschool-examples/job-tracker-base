class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :text
      t.references :job, index: true, foreign_key: true

      t.timestamps
    end
  end
end
