class CreateCompaniesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :companies_tags do |t|
      t.references :company, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
