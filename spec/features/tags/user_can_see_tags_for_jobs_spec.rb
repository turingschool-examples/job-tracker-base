require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job.tags.create!(name: "Awesome")
    job.tags.create!(name: "Baller")

    visit company_job_path(company, job)

    expect(page).to have_content("Awesome")
    expect(page).to have_content("Baller")
  end
end
