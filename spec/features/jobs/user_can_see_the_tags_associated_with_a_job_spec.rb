require 'rails_helper'

describe "User visits a job page" do
  scenario "a user can see tags associated with a job" do
    company = Company.create!(name: "ESPN")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    tag = job.tags.create(text: "Cool location")
    tag2 = job.tags.create(text: "Good benefits")

    visit company_job_path(company, job)

    expect(page).to have_content(tag.text)
    expect(page).to have_content(tag2.text)
  end
end
