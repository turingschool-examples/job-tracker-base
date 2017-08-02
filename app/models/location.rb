class Location < ApplicationRecord
  has_many :companies_locations
  has_many :companies, through: :companies_locations
end
