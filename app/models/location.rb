class Location < ApplicationRecord
  validates :city, presence: true
  has_many :companies_locations
  has_many :companies, through: :companies_locations
end
