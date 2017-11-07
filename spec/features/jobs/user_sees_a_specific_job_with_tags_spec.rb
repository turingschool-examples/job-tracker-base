require 'rails_helper'

feature "User sees a specific job" do
  scenario "with tag associated to that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag = job.tags.create(name: "Tech")

    visit company_job_path(company, job)

    expect(page).to have_content(tag.name)
  end

  scenario "with multipe tags asssociated to that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer",
                                level_of_interest: 70,
                                city: "Denver",
                                salary: 60000)
    tag1 = job.tags.create!(name: "Tech")
    tag2 = job.tags.create!(name: "Good Location")

    visit company_job_path(company, job)

    expect(page).to have_content(tag1.name)
    expect(page).to have_content(tag2.name)
  end

  scenario "with count of jobs associated to that tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create!(name: "Tech")
    JobTag.create(job: job1, tag: tag1)
    job2 = company.jobs.create!(title: "Software Engineer", level_of_interest: 80, city: "Dallas")
    JobTag.create(job: job2, tag: tag1)

    visit company_job_path(company, job1)

    expect(page).to have_content(2)
  end

  scenario "with count of jobs associated to that tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create!(name: "Tech")
    JobTag.create(job: job1, tag: tag1)
    job2 = company.jobs.create!(title: "Software Engineer", level_of_interest: 80, city: "Dallas")
    JobTag.create(job: job2, tag: tag1)
    job3  = company.jobs.create!(title: "QA", level_of_interest: 30, city: "Carson City")
    JobTag.create(job: job3, tag: tag1)

    visit company_job_path(company, job1)

    expect(page).to have_content(3)
  end

  scenario "with average job salary associated to that tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer",
                                level_of_interest: 70,
                                city: "Denver",
                                salary: 60000)
    tag1 = Tag.create!(name: "Tech")
    JobTag.create(job: job1, tag: tag1)
    job2 = company.jobs.create!(title: "Software Engineer",
                                level_of_interest: 80,
                                city: "Dallas",
                                salary: 80000)
    JobTag.create(job: job2, tag: tag1)

    visit company_job_path(company, job1)

    expect(page).to have_content("$70,000")
  end
end
