require 'rails_helper'

describe "User visits job page" do
  scenario "a user sees all tags for specific job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job.tags.create!(name: "Great Location")
    job.tags.create!(name: "Great Merntains")

    visit company_job_path(company, job)

    expect(page).to have_content(job.tags.first.name)
    expect(page).to have_content(job.tags.last.name)
    expect(page).to have_content(job.title)
  end
end
