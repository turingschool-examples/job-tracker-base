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

  scenario "a user sees the mame of each of the tags associated with that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = Tag.create(name: "Software")

    job.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content(tag.name)
  end

  scenario "I also see a count of how many jobs have each specific tag listed." do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Front-end Developer", level_of_interest: 70, city: "Denver")
    job3 = company.jobs.create!(title: "Senior Developer", level_of_interest: 70, city: "Denver")
    job4 = company.jobs.create!(title: "Site Reliability Eng", level_of_interest: 70, city: "Denver")
    job5 = company.jobs.create!(title: "Product Manager", level_of_interest: 70, city: "Denver")

    tag = Tag.create(name: "Software")

    job1.tags << tag
    job2.tags << tag
    job3.tags << tag
    job4.tags << tag
    job5.tags << tag


    visit company_job_path(company, job1)

    expect(page).to have_content(tag.name)
    expect(page).to have_content("Software - 5 ")
  end
end
