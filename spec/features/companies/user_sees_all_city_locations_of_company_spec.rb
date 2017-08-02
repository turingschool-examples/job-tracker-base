require 'rails_helper'

RSpec.describe "User visits a specific company page" do
  scenario "and sees all cities where offices are located for company" do
    company = Company.create!(name: "Turing")
    location = company.locations.create!(city: "Denver")
    location = company.locations.create!(city: "Maui")
    location = company.locations.create!(city: "St. Louis")

    visit company_path(company)

    expect(page).to have_content("Denver")
    expect(page).to have_content("Maui")
    expect(page).to have_content("St. Louis")
  end
end
