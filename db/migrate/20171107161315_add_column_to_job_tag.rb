class AddColumnToJobTag < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobtags, :job
    add_reference :jobtags, :tag
  end
end
