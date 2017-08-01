require 'rails_helper'

describe "User visits a job page" do
  scenario "also sees tags associated with that job" do
    company = Company.create(name: "Pizza Planet")
    job = Job.create(title: "Cook", level_of_interest: 50, city: "Mars", salary: 35000, company_id: company.id)
    tag = job.tags.create(name: "Food")

    visit company_job_path(company.id, job.id)
save_and_open_page
    expect(page).to have_content("Pizza Planet")
    expect(page).to have_content("Cook")
    expect(page).to have_content("50")
    expect(page).to have_content("Food")
  end
end
