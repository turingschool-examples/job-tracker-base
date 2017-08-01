require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees tags with average job salary" do

    # As a user,
    # When I visit a specific job page,
    # I also see an average salary for all jobs within each specific tag listed.

    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                   city: "Denver", salary: 70000)
    job1    = company.jobs.create!(title: "Teacher", level_of_interest: 50,
                                   city: "Denver", salary: 50000)
    job2    = company.jobs.create!(title: "President", level_of_interest: 100,
                                   city: "Denver", salary: 100000)
    job3    = company.jobs.create!(title: "Accountant", level_of_interest: 20,
                                   city: "Denver", salary: 80000)
    tag     = job.tags.create!(name: "Tech")
    tag1    = job.tags.create!(name: "Engineering")

    job1.tags << tag
    job2.tags << tag
    job3.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Tech")
    expect(page).to have_content("# of Jobs: 4")
    expect(page).to have_content("Average Salary: 75000")
    expect(page).to have_content("Engineering")
    expect(page).to have_content("# of Jobs: 1")
    expect(page).to have_content("Average Salary: 70000")
  end
end
