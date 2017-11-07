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

  scenario "a user sees tags for a specific job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)
#     As a user,
#     When I visit a specific job page,
#     I see the name of each of the tags associated with that job.
  end

  scenario "a user sees count of jobs for each tag for a job" do
  # As a user,
  # When I visit a specific job page,
  # I also see a count of how many jobs have each specific tag listed.
  end

  scenario "a user sees the average salary for all jobs with a tag" do
    # As a user,
    # When I visit a specific job page,
    # I also see an average salary for all jobs within each specific tag listed.
  end
end
