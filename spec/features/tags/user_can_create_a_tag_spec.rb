require 'rails_helper'

RSpec.feature "User can create a tag" do
  scenario "and see the tag created" do
    company = Company.create(name: "Adidas") 
    job = Job.create!(title: "Analyst", description: "Awesome job", level_of_interest: 1, company_id: company.id, city: "Los", salary: 500)

    visit new_tag_path

    fill_in "tag[title]", with: "Set up interview"
    click_on "Create Tag"

    expect(page).to have_content("Set up interview")
  end
end

