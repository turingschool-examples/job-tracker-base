require 'rails_helper'

describe "User visits a Job's show page" do
  scenario "user sees an average salary for all jobs within each specific tag listed" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 10)

    job.tags.create(title: "Tech")
    job.tags.create(title: "Mountain")

    Tag.first.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver", salary: 20)
    Tag.first.jobs.create(title: "Developer", level_of_interest: 80, city: "Denver", salary: 30)

    Tag.last.jobs.create(title: "Saiyan", level_of_interest: 9001, city: "Vegeta", salary: 9000)

    visit company_job_path(company, job)

    expect(page).to have_content(20)
    expect(page).to have_content(5005)
  end
end
