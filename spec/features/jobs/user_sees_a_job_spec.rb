require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 1500)
    job_two = company.jobs.create!(title: "Project Manager", level_of_interest: 80, city: "Denver", salary: 2100)
    tag_one = job.tags.create(name: "Software")
    tag_two = job.tags.create(name: "Leadership")
    job_two = job_two.tags << tag_one

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content tag_one.name
    expect(page).to have_content tag_two.name
    expect(page).to have_content 1800
  end
end
