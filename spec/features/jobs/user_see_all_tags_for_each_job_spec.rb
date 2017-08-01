require 'rails_helper'

RSpec.describe "User visits individual job page" do
  scenario "and sees all tags for that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    tag1 = job.tags.create!(title: "Management")
    tag2 = job.tags.create!(title: "Development")
    tag3 = job.tags.create!(title: "Remote")
    visit company_job_path(company, job)

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content tag1.title
    expect(page).to have_content tag2.title
    expect(page).to have_content tag3.title
  end
end
