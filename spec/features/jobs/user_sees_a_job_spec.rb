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
  scenario "and sees the name of each tag associated with that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = job.tags.create!(name: "Rails")
    tag_2 = job.tags.create!(name: "Tech")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Rails")
    expect(page).to have_content("Tech")
  end
  scenario "and each tag has a number with each job associated next to it" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job_2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job_3 = company.jobs.create!(title: "Engineer", level_of_interest: 70, city: "Denver")
    tag = job.tags.create!(name: "Development")
    tag_2 = job.tags.create!(name: "Tech")
    job_2.tags << tag
    job_2.tags << tag_2
    tag_3 = job_3.tags.create!(name: "Engineering")
    job_3.tags << tag_2

    visit company_job_path(company, job)
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Development")
    expect(page).to have_content("Tech")
    expect(page).to have_content("2")
    expect(page).to have_content("3")
  end
  scenario "and sees the average salary for that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 70000)
    tag = job.tags.create!(name: "Rails")
    job_2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 50000)
    job_2.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Rails")
    expect(page).to have_content("60000")
  end
end