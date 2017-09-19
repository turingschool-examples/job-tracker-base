require "rails_helper"

describe "User visits a job's show page" do
  scenario "a user sees all the tags associated with a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    job.tags.create(title: "Tech")
    job.tags.create(title: "Mountain")

    visit company_job_path(company, job)

    expect(page).to have_content("Tech")
    expect(page).to have_content("Mountain")
  end
end
