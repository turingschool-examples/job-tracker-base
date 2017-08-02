require 'rails_helper'

RSpec.describe "User visits a specific company page" do
  scenario "and sees all cities where offices are located for company" do
    company = Company.create!(name: "Turing")
    location = company.locations.create!(city: "Denver")
    location = company.locations.create!(city: "Maui")
    location = company.locations.create!(city: "St. Louis")
    # byebug
    visit company_path(company)
    # save_and_open_page
    expect(page).to have_content("Denver")
    expect(page).to have_content("Maui")
    expect(page).to have_content("St. Louis")
  end
end

# As a user,
# When I visit a specific company page,
# I also see a count of how many offices that company has in each specific location listed in descending order.
