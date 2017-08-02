class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  def self.city_count(city_name)
    where(city: "#{city_name}").count
  end
end
