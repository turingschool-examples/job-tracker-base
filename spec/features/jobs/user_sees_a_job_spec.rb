require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_1 = Tag.create!(name: "Technology")
    tag_2 = Tag.create!(name: "Software")
    job.tags << tag_1
    job.tags << tag_2

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("Technology")
    expect(page).to have_content("Software")

  end
end
