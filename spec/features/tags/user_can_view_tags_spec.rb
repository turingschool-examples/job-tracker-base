require 'rails_helper'

describe "User sees a specific job" do
  scenario "and can see the tags associated with that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Basket Weaver", level_of_interest: 70, city: "Denver")
    tag1 = job.tags.create(name: "Good Benefits")
    tag2 = job2.tags.create(name: "Commute")
    tag3 = job.tags.create(name: "Coffee")

    visit company_job_path(company, job)

    expect(page).to have_content("#{tag1.name}")
    expect(page).to have_content("#{job.title}")
    expect(page).to have_content("#{tag3.name}")
    expect(page).to_not have_content("#{job2.title}")
    expect(page).to_not have_content("#{tag2.name}")
  end

  scenario "and can see the count of jobs that have that tag" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Basket Weaver", level_of_interest: 70, city: "Denver")
    tag1 = job.tags.create(name: "Good Benefits")
    tag2 = job2.tags.create(name: "Commute")
    tag3 = job.tags.create(name: "Coffee")
    job.tags << tag2

    visit company_job_path(company, job)

    expect(page).to have_content("Commute - 2")
    expect(page).to have_content("Good Benefits - 1")
    expect(page).to have_content("Coffee - 1")
  end

  scenario "and can see the count of jobs that have that tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 50000)
    job2 = company.jobs.create!(title: "Basket Weaver", level_of_interest: 70, city: "Denver", salary: 100000)
    tag = Tag.create(name: "Coffee")

    job1.tags << tag
    job2.tags << tag

    visit company_job_path(company, job1)

    expect(page).to have_content("Coffee - 2 ($75,000.00)")
  end

end
