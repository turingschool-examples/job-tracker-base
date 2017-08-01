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

  scenario "sees all tags for job with job count and average salary for each tag" do
    company = Company.create!(name: "ESPN")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 30)
    job_2 = company.jobs.create!(title: "Developer 2", level_of_interest: 70, city: "Denver", salary: 40)
    job_3 = company.jobs.create!(title: "Manager", level_of_interest: 70, city: "Denver", salary: 50)
    job_4 = company.jobs.create!(title: "Assistant", level_of_interest: 70, city: "Denver", salary: 30)

    engineering = Tag.create!(name: "engineering")
    tech = Tag.create!(name: "tech")
    hr = Tag.create!(name: "Human Resources")

    engineering.jobs << [job_1, job_2]
    tech.jobs << [job_1, job_2, job_3]

    visit company_job_path(company, job_1)

    expect(page).to have_content("Developer")
    expect(page).to have_content("engineering - 2 (35)")
    expect(page).to have_content("tech - 3 (40)")
    expect(page).to_not have_content("Human Resources")
  end
end
