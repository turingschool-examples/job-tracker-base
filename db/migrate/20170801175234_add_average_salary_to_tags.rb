class AddAverageSalaryToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :average_salary, :integer
  end
end
