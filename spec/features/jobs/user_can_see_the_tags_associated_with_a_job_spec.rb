require 'rails_helper'

describe "User visits a job page" do
  scenario "a user can see tags associated with a job" do
    company = Company.create!(name: "ESPN")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    tag = Tag.create(text: "Cool location")
    tag2 = Tag.create(text: "Good benefits")

    JobTag.create(tag: tag, job: job)
    JobTag.create(tag: tag2, job: job)

    visit company_job_path(company, job)

    expect(page).to have_content(tag.text)
    expect(page).to have_content(tag2.text)
  end
  scenario "a user can see the count of jobs with a particular tag" do
    company = Company.create!(name: "ESPN")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Database Janitor", level_of_interest: 70, city: "Denver")

    tag = Tag.create(text: "Cool location")
    tag2 = Tag.create(text: "Good benefits")

    JobTag.create(tag: tag, job: job)
    JobTag.create(tag: tag, job: job)
    JobTag.create(tag: tag2, job: job2)

    visit company_job_path(company, job)

    expect(page).to have_content("#{tag.text} - 2")
  end
  scenario "a user can see the average salary for jobs with a particular tag" do
    company = Company.create!(name: "ESPN")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 10000)
    job2 = company.jobs.create!(title: "Fortran Developer", level_of_interest: 70, city: "Denver", salary: 12000)
    job3 = company.jobs.create!(title: "Fortran Developer", level_of_interest: 70, city: "Denver", salary: 9000)

    tag = Tag.create(text: 'coolio')
    tag2 = Tag.create(text: 'coolio')
    tag3 = Tag.create(text: 'coolio')

    JobTag.create(job: job, tag: tag)
    JobTag.create(job: job2, tag: tag)
    JobTag.create(job: job3, tag: tag)

    visit company_job_path(company, job)

    expect(page).to have_content("#{tag.text} - 3 - ($10,333.33)")
  end
end
