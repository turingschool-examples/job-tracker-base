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
  scenario "a user sees tags for that specific job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_1 = job.tags.create!(title: "Good Location")
    tag_2 = job.tags.create!(title: "Great Salary")
    tag_3 = job.tags.create!(title: "Good Management")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("Good Management")
    expect(page).to have_content("Great Salary")
    expect(page).to have_content("Good Location")
  end
  scenario "a user sees count of how many jobs have a specific tag" do
    company = Company.create!(name: "ESPN")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job_2 = company.jobs.create!(title: "ButtMonkey", level_of_interest: 60, city: "New York")
    tag_1 = Tag.create!(title: "Good Location")
    tag_2 = Tag.create!(title: "Great Salary")
    tag_3 = Tag.create!(title: "Good Management")

    JobTag.create(job: job_1, tag: tag_1)
    JobTag.create(job: job_2, tag: tag_1)
    JobTag.create(job: job_1, tag: tag_2)
    JobTag.create(job: job_1, tag: tag_3)
    JobTag.create(job: job_2, tag: tag_3)

    visit company_job_path(company, job_1)

    expect(page).to have_content("Good Management")
    expect(page).to have_content("Great Salary")
    expect(page).to have_content("Good Location")
    expect(page).to have_content("2")
    expect(page).to have_content("1")
  end
end
