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

scenario "a user sees a tags for a job for a specific company" do
  company = Company.create!(name: "ESPN")
  job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
  tag_1 = Tag.create(title: "Great Location")
  tag_2 = Tag.create(title: "Great Benefits")

  visit company_job_path(company, job)

  expect(page).to have_content("ESPN")
  expect(page).to have_content("Developer")
  expect(page).to have_content("70")

end
