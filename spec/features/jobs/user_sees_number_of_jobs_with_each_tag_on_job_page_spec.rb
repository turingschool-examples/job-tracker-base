require 'rails_helper'

RSpec.feature "user will see a count of how many jobs have each specifc tag" do
  scenario "on job page" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = job1.tags.create!(name: "remote")
    tag2 = job1.tags.create!(name: "fun")
    job2 = tag1.jobs.create!(title: "Ninja", level_of_interest: 90, city: "Boston")

    visit company_job_path(company, job1)

    expect(page).to have_content("remote: 2 jobs")
    expect(page).to have_content("fun: 1 job")
  end
end
