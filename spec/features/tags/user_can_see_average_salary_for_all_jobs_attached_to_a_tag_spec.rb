
require 'rails_helper'

describe "User visits a specific job" do
  scenario "a user can see average sallary for all jobs wth tag" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", salary: 30000, level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Developer2", salary: 10000, level_of_interest: 70, city: "Denver")
    tag1 = Tag.create!(name: "Awesome")
    job.tags << tag1
    job2.tags << tag1

    visit company_job_path(company, job)

    expect(page).to have_content("Awesome - 2 ($20000)")

  end
end



# As a user,
# When I visit a specific job page,
# I also see a count of how many jobs have each specific tag listed.
