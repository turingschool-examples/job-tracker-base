class AddTagIdToJob < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :tag, foreign_key: true
  end
end
