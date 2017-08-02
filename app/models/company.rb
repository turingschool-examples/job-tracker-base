class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :companies_locations
  has_many :locations, through: :companies_locations
end
