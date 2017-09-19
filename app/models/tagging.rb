class Tagging < ActiveRecord::Base
  belongs_to :job
  belongs_to :tag

  def count(id)
    where(tag_id: id).count
  end
end
