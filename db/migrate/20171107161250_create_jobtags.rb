class CreateJobtags < ActiveRecord::Migration[5.0]
  def change
    create_table :jobtags do |t|

      t.timestamps
    end
  end
end
