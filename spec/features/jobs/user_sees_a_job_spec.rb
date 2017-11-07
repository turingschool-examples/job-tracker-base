require 'rails_helper'

describe "User sees a specific job" do
  before do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 80000)
    job2 = company.jobs.create!(title: "Sales Manager", level_of_interest: 80, city: "Atlanta", salary: 60000)
    tag1 = Tag.create(name: "tech")
    tag2 = Tag.create(name: "high interest")
    tag3 = Tag.create(name: "sales")
    Tagging.create(job: job1, tag: tag1)
    Tagging.create(job: job1, tag: tag2)
    Tagging.create(job: job2, tag: tag2)
    visit company_job_path(company, job1)
  end

  scenario "a user sees a job for a specific company" do
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user sees the name of tags associated with that job" do
    expect(page).to have_content("tech")
    expect(page).to have_content("high interest")
    expect(page).to_not have_content("sales")
  end

  scenario "a user sees a count of how many jobs have each specific tag listed" do
    expect(page).to have_content("tech - 1")
    expect(page).to have_content("high interest - 2")
  end

  scenario "a user sees a specific job page" do
    expect(page).to have_content("(Average Salary for Jobs with this Tag: $80000)")
    expect(page).to have_content("(Average Salary for Jobs with this Tag: $70000)")
    save_and_open_page
  end
end
