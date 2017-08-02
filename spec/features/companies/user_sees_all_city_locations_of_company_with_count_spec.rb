require 'rails_helper'

RSpec.describe "User visits a specific company page" do
  scenario "and sees all cities where offices are located for company with quantity" do
    company = Company.create!(name: "Turing")
    location = company.locations.create!(city: "Denver")
    location = company.locations.create!(city: "Maui")
    location = company.locations.create!(city: "St. Louis")

    company2 = Company.create!(name: "CodeLand")
    location = company2.locations.create!(city: "Denver")
    location = company2.locations.create!(city: "Denver")

    visit company_path(company)
    expect(page).to have_content("Denver - 3")
    expect(page).to have_content("Maui - 1")
    expect(page).to have_content("St. Louis - 1")
  end
end
