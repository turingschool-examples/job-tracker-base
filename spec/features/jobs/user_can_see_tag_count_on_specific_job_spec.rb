require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees tags with total job count" do

    # As a user,
    # When I visit a specific job page,
    # I also see a count of how many jobs have each specific tag listed.

    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                   city: "Denver", salary: 70000)
    job1    = company.jobs.create!(title: "Teacher", level_of_interest: 50,
                                   city: "Denver", salary: 50000)
    tag     = job.tags.create!(name: "Tech")
    tag1    = job.tags.create!(name: "Engineering")

    job1.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Tech")
    expect(page).to have_content("# of Jobs: 2")
    expect(page).to have_content("Engineering")
    expect(page).to have_content("# of Jobs: 1")
  end

  scenario "a user doesn't sees tags with no jobs" do
    company = Company.create!(name: "ESPN")
    job     = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                   city: "Denver", salary: 70000)
    job1    = company.jobs.create!(title: "Teacher", level_of_interest: 50,
                                   city: "Denver", salary: 50000)
    job2    = company.jobs.create!(title: "President", level_of_interest: 100,
                                   city: "Denver", salary: 100000)
    tag     = job.tags.create!(name: "Tech")
    tag1    = job.tags.create!(name: "Engineering")
    tag2    = Tag.create!(name: "Management")

    job2.tags << [tag, tag1, tag2]

    visit company_job_path(company, job2)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("President")
    expect(page).to have_content("Tech")
    expect(page).to have_content("# of Jobs: 2")
    expect(page).to have_content("Engineering")
    expect(page).to have_content("# of Jobs: 2")
    expect(page).to have_content("Management")
    expect(page).to have_content("# of Jobs: 1")

    visit company_job_path(company, job1)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Teacher")
    expect(page).to_not have_content("Tech")
    expect(page).to_not have_content("Engineering")
    expect(page).to_not have_content("Management")
  end
end
