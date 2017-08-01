FactoryGirl.define do
  factory :company do
    name {generate(:company_name)}
  end

  sequence :company_name do |n|
    "Company #{n}"
  end


end
