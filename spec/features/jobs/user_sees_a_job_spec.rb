require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "I see the name of each of the tags associated with that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_1 = job.tags.create!(title: "Software")
    tag_2 = job.tags.create!(title: "Good-Location")

    visit company_job_path(company, job)
    save_and_open_page

    expect(page).to have_content("Software")
    expect(page).to have_content("Good-Location")

  end
end
