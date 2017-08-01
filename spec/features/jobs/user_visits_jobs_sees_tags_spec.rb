require 'rails_helper'


RSpec.describe "user visits job page" do
  scenario "user sees tag name associated with job" do

    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")


    visit company_job_path(company, job)

    expect(page).to have_content("Tags:")

  end
  scenario "user sees count of jobs with  specific tag listed" do

    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")




  end
  scenario "user sees average salary for all jobs from spepcific tag listed" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")


  end
end
