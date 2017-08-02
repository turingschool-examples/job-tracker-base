class CompaniesLocations < ApplicationRecord
  belongs_to :company
  belongs_to :location
end
