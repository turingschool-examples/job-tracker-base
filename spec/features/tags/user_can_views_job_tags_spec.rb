require 'rails_helper'

RSpec.feature "User can view a jobs tags" do
  scenario "and see those tags" do
    company = Company.create(name: "Nike")
    job = Job.create!(title: "Analyst", description: "Awesome job", level_of_interest: 1, company_id: company.id, city: "Los", salary: 500)
    tag = Tag.create(title: "Set up interview")
    tag2 = Tag.create(title: "Callback")

    visit company_job_path(company, job)

    expect(page).to have_content("Set up interview")
    expect(page).to have_content("Callback")

  end
end
