require 'rails_helper'
# As a user,
RSpec.describe "User visits individual job page" do
  scenario "and sees a job count for each tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Office Manager", level_of_interest: 70, city: "Denver")

    tag1 = job1.tags.create!(title: "Wizard")
    tag2 = job1.tags.create!(title: "Development")
    tag3 = job1.tags.create!(title: "Remote")

    job2.tags << tag2

    visit company_job_path(company, job1)

    expect(tag1.job_count).to eq 1
    expect(tag2.job_count).to eq 2
    expect(tag3.job_count).to eq 1
    expect(page).to have_content tag1.job_count
    expect(page).to have_content tag2.job_count
    expect(page).to have_content tag3.job_count
  end
end
# When I visit a specific job page,
# I also see a count of how many jobs have each specific tag listed.
