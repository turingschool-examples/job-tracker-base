require 'rails_helper'

describe "when a user visits a specific job page" do
  scenario "they can see all tags associated with that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 200)
    tag1 = job.tags.create(name: "Software")
    tag2 = job.tags.create(name: "Coding")

    visit company_job_path(company, job)

    expect(page).to have_content(tag1.name)
    expect(page).to have_content(tag2.name)
  end
end
