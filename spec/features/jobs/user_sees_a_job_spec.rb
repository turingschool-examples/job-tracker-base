require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_one = job.tags.create(name: "Software")
    tag_two = job.tags.create(name: "Leadership")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content tag_one.name
    expect(page).to have_content tag_two.name
    expect(page).to have_content Job.average_salary(tag_one.id)
  end
end
