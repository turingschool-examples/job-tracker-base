require 'rails_helper'

describe "User sees a specific job with associated tags" do
  scenario "a user sees a tags on the jobs" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create!(name: "sportsball")
    tag2 = Tag.create!(name: "throwing things")
    JobTag.create!(job: job, tag: tag1)
    JobTag.create!(job: job, tag: tag2)

    visit company_job_path(company, job)

    expect(page).to have_content("sportsball")
    expect(page).to have_content("throwing things")
    expect(page).to have_content("Developer")
  end

  scenario "a user sees a count of jobs for each tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "HR", level_of_interest: 50, city: "SF")
    job3 = company.jobs.create!(title: "CTO", level_of_interest: 50, city: "SF")
    tag1 = Tag.create!(name: "sportsball")
    JobTag.create!(job: job1, tag: tag1)
    JobTag.create!(job: job2, tag: tag1)
    JobTag.create!(job: job3, tag: tag1)

    visit company_job_path(company, job1)

    expect(page).not_to have_content("2")
    expect(page).to have_content("3")
    expect(page).to have_content("sportsball")
  end

  scenario "a user sees an average_salary for each tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "HR", level_of_interest: 50, city: "SF")
    job3 = company.jobs.create!(title: "CTO", level_of_interest: 50, city: "SF")
    tag1 = Tag.create!(name: "sportsball")
    JobTag.create!(job: job1, tag: tag1)
    JobTag.create!(job: job2, tag: tag1)
    JobTag.create!(job: job3, tag: tag1)

    visit company_job_path(company, job1)

    expect(page).not_to have_content("70000")
    expect(page).to have_content("sportsball")
  end
end
