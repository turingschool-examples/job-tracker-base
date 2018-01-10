require 'rails_helper'

describe "User sees a specific job with associated tags" do
  scenario "a user sees a tags on the jobs" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create!(name: "sportsball", job_id: 1)
    tag2 = Tag.create!(name: "throwing things", job_id: 1)

    visit company_job_path(company, job)

    expect(page).to have_content("sportsball")
    expect(page).to have_content("throwing things")
    expect(page).to have_content("Developer")
  end
end
