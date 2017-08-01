require 'rails_helper'


RSpec.describe "user visits job page" do
  scenario "user sees tag name associated with job" do

    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = job.tags.create(name: "Software")

    visit company_job_path(company, job)

    expect(page).to have_content("Tags: #{tag.name}")

  end
  scenario "user sees count of jobs with  specific tag listed" do


    company1 = Company.create!(name: "ESPN")
    job1 = company1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = job1.tags.create(name: "Software")
    company2 = Company.create!(name: "WacDonalds")
    job2 = company1.jobs.create!(title: "Developer", level_of_interest: 70, city: "FoCo")
    tag2 = job1.tags.create(name: "Software")

    visit company_job_path(company1, job1)

    expect(page).to have_content("Tags: #{tag1.name}, 2")

  end
  scenario "user sees average salary for all jobs from spepcific tag listed" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")


  end
end
