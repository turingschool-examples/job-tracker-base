require 'rails_helper'

describe "User sees tags" do
  scenario "when viewing a specific job page" do
    company  = Company.create!(name: "Big Blue")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = job.tags.create!(name: "Job Tag")
    tag2 = job.tags.create!(name: "Work Tag")

    visit company_job_path(company, job)

    expect(page).to have_content("Big Blue")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("Job Tag")
  end
end
