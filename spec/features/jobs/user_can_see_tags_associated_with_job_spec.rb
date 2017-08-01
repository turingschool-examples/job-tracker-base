require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees tags for a specific job" do

    # As a user,
    # When I visit a specific job page,
    # I see the name of each of the tags associated with that job.

    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                   city: "Denver", salary: 70000)
    job.tags.create!(name: "Tech")
    job.tags.create!(name: "Engineering")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Tech")
    expect(page).to have_content("Engineering")
  end

  scenario "a user doesn't sees tags for a different job" do
    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                   city: "Denver", salary: 70000)
    job1    = company.jobs.create!(title: "Teacher", level_of_interest: 50,
                                   city: "Denver", salary: 50000)
    job.tags.create!(name: "Tech")
    job.tags.create!(name: "Engineering")

    visit company_job_path(company, job1)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Teacher")
    expect(page).to_not have_content("Tech")
    expect(page).to_not have_content("Engineering")
  end

  scenario "a user doesn't sees tags if job has no tags" do
    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                   city: "Denver", salary: 70000)
    Tag.create!(name: "Tech")
    Tag.create!(name: "Engineering")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to_not have_content("Tech")
    expect(page).to_not have_content("Engineering")
  end
end
