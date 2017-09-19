require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 50)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user sees the tags for a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 50)
    tag_1 = job.tags.create(title: 'Software')
    tag_2 = job.tags.create(title: 'Fun')
    # As a user,
    # When I visit a specific job page,
    visit company_job_path(company, job)
    # I see the name of each of the tags associated with that job.
    expect(page).to have_content(tag_1.title)
    expect(page).to have_content(tag_2.title)
  end

  scenario "a user sees a count of how many jobs a tag has" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 50)
    tag_1 = job.tags.create(title: 'Software')
    tag_2 = job.tags.create(title: 'Fun')

    visit company_job_path(company, job)

    expect(page).to have_content("- #{job.tags.count}")
  end

  scenario "a user sees an average salar for all jobs within each tag" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 50)
    job_2 = company.jobs.create!(title: "Developer2", level_of_interest: 70, city: "Denver", salary: 75)
    job_3 = company.jobs.create!(title: "Developer3", level_of_interest: 70, city: "Denver", salary: 100)

    tag_1 = Tag.create(title: 'Software')
    job.tags << tag_1
    job_2.tags << tag_1
    job_3.tags << tag_1
  # As a user,
  # When I visit a specific job page,
    visit company_job_path(company, job)
  # I also see an average salary for all jobs within each specific tag listed.
    expect(page).to have_content("Software - 1 - (#{job.avg_salary})")
  end
end
