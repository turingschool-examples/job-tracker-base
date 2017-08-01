require 'rails_helper'

RSpec.feature "User can create a tag" do
  scenario "for a specific job" do
    company = Company.create(name: "Adidas") 
    job = Job.create!(title: "Analyst", description: "Awesome job", level_of_interest: 1, company_id: company.id, city: "Los", salary: 500)

    visit company_job_path(company, job)

    click_link "Add Tag"
    fill_in "tag[title]", with: "Set up interview"
    click_on "Create Tag"

    expect(current_path).to eq(company_job_path(companym job))
    expect(page).to have_content("Set up interview")
  end
end

