class CompanyJob < ApplicationRecord
  belongs_to :job
  belongs_to :company
end
