class AddSalaryToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :salary, :integer
  end
end
