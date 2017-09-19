require 'rails_helper'

describe "As a user, I visit a specific job page," do
  it "I see the name of each of the tags associated with that job." do
    company = Company.create!(name: "ESPN")
    job_tag = JobTag.create!(title: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", job_tag_id: job_tag.id)

    visit company_job_path(company, job)

    expect(page).to have_content("Software")

  end
end
