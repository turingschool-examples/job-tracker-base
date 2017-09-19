require 'rails_helper'

describe "User sees a specific job" do
  scenario "and can see the tags associated with that job" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Basket Weaver", level_of_interest: 70, city: "Denver")
    tag1 = job1.tags.create(name: "Good Benefits")
    tag2 = job2.tags.create(name: "Commute")
    tag3 = job2.tags.create(name: "Coffee")

    visit company_job_path(company, job1)

    expect(page).to have_content("#{tag1.name}")
    expect(page).to have_content("#{job1.name}")
    expect(page).to have_content("#{tag3.name}")
    expect(page).to_not have_content("#{job2.name}")
    expect(page).to_not have_content("#{tag2.name}")


  end
end




# As a user,
# When I visit a specific job page,
# I see the name of each of the tags associated with that job.

# As a user,
# When I visit a specific job page,
# I also see a count of how many jobs have each specific tag listed.

# As a user,
# When I visit a specific job page,
# I also see an average salary for all jobs within each specific tag listed.
