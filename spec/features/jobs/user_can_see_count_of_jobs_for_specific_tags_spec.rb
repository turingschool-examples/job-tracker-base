require 'rails_helper'

describe "when a user visits a specific job page" do
  scenario "they can see count of jobs associated with tags" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 100)
    job2 = company.jobs.create!(title: "Software Engineer", level_of_interest: 60, city: "San Fran", salary: 200)
    tag1 = Tag.create(name: "Software")
    tag2 = Tag.create(name: "Coding")
    job1.tags = [tag1, tag2]
    job2.tags = [tag1, tag2]


    visit company_job_path(company, job1)

    expect(page).to have_content("#{tag1.name} - 2")
    expect(page).to have_content("#{tag2.name} - 2")
  end
end
