
require 'rails_helper'

describe "User visits a specific job" do
  scenario "a user can see how many jobs share the same tags" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Developer2", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create!(name: "Awesome")
    tag2 = Tag.create!(name: "Baller")
    job.tags << tag1
    job.tags << tag2
    job2.tags << tag1

    visit company_job_path(company, job)

    expect(page).to have_content("Awesome - 2")
    expect(page).to have_content("Baller - 1")
  end
end



# As a user,
# When I visit a specific job page,
# I also see a count of how many jobs have each specific tag listed.
