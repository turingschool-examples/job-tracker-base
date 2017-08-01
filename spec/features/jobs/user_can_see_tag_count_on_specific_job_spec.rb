require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees tags with total job count" do

    # As a user,
    # When I visit a specific job page,
    # I also see a count of how many jobs have each specific tag listed.

    company = Company.create!(name: "ESPN")
    job  = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job1  = company.jobs.create!(title: "Tacher", level_of_interest: 50, city: "Denver")
    tag  = job.tags.create!(name: "Tech")
    tag1 = job.tags.create!(name: "Engineering")

    job1.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Tech, 2")
    expect(page).to have_content("Engineering, 1")
  end
end
