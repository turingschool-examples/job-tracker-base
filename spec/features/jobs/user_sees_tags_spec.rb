require 'rails_helper'

describe "User visits job page" do
  before(:each) do
    @company = Company.create!(name: "ESPN")
    @job = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    @job.tags.create!(name: "Great Location")
    @job.tags.create!(name: "Great Merntains")
  end

  scenario "a user sees all tags for specific job" do

    visit company_job_path(@company, @job)

    expect(page).to have_content(@job.tags.first.name)
    expect(page).to have_content(@job.tags.last.name)
    expect(page).to have_content(@job.title)
  end

  scenario "a user sees all tags for specific job" do
    company2 = Company.create!(name: "Different")
    job2 = company2.jobs.create!(title: "Design", level_of_interest: 40, city: "Seattle")
    job2.tags.create!(name: "Great Location")
    job2.tags.create!(name: "Great Merntains")

    company3 = Company.create!(name: "Even Differenter")
    job3 = company3.jobs.create!(title: "Software", level_of_interest: 54, city: "Washington")
    job3.tags.create!(name: "Great Location")
    job3.tags.create!(name: "Great Pizza")

    visit company_job_path(@company, @job)

    expect(page).to have_content("#{job.tags.first.name} - 3")
    expect(page).to have_content("#{job.tags.first.name} - 2")
    expect(page).to have_content(job.title)
  end
end
