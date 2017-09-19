require 'rails_helper'

RSpec.feature "user can see tags" do
  scenario "on job page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = job.tags.create!(name: "remote")
    tag2 = job.tags.create!(name: "fun")
    tag3 = Tag.create!(name: "silly")

    visit company_job_path(company, job)

    expect(page).to have_content(tag1.name)
    expect(page).to have_content(tag2.name)
    expect(page).to_not have_content(tag3.name)
  end
end
