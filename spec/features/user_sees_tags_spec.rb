  #When I visit a specific job page,
  #As a user I see the name of each of the tags associated with that job.

require 'rails_helper'

RSpec.describe "User sees tags" do
  it "a user sees tags on a specific job page" do
    company = Company.create(name: "Turning")
    job = company.jobs.create(title: "Ag", description: "work with plants", level_of_interest: 98, city: "Denver", salary: 1)
    job.tags.create(name: "hot job")

    visit company_job_path(company, job)

    expect(page).to have_content("Turing")
    expect(page).to have_content("Ag")
    expect(page).to have_content("hot job")
  end
  end

