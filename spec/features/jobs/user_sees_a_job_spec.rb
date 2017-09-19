require 'rails_helper'

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

  scenario 'a user sees the name & count of each tag for a specific job' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = job.tags.create(name: "Software")

    visit company_job_path(company, job)

    expect(page).to have_content("Software")
    expect(page).to have_content(1)
  end

  scenario 'a user sees the average salary for a specified job' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 22000)
    tag = job.tags.create(name: "Software")

    visit company_job_path(company, job)
    expect(page).to have_content(22000)
  end

end
