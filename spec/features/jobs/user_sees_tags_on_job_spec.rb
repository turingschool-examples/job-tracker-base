
require 'rails_helper'

describe "User sees a specific job" do
  scenario "and sees all the tags for that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create(name: "Tech")
    tag2 = Tag.create(name: "Education")
    job.tags << tag1
    job.tags << tag2


    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("Tech")
    expect(page).to have_content("Education")
  end
  scenario "and sees total count of jobs for tag" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job1 = company.jobs.create!(title: "Teacher", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create(name: "Tech")
    tag2 = Tag.create(name: "Education")
    job.tags << tag1
    job.tags << tag2
    job1.tags << tag2

    visit company_job_path(company, job)
    save_and_open_page

    expect(page).to have_content("1")
    expect(page).to have_content("2")
  end
end
