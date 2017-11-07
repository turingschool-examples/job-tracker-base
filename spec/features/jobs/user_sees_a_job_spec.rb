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

  scenario 'user sees all tags for that job' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 100000)
    tag = company.jobs.last.tags.create!(name: "Sports Entertainment")

    visit company_job_path(company, job)
    save_and_open_page
    expect(page).to have_content("Tags:")
    expect(page).to have_content("Sports Entertainment")
    expect(page).to have_content("1")
    expect(page).to have_content("$100,000")
  end
end
