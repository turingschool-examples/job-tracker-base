require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "I see the name of each of the tags associated with that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_1 = job.tags.create!(title: "Software")
    tag_2 = job.tags.create!(title: "Good-Location")

    visit company_job_path(company, job)
    save_and_open_page

    expect(page).to have_content("Software")
    expect(page).to have_content("Good-Location")

  end

  scenario "I also see a count of how many jobs have each specific tag listed." do
    company = Company.create!(name: "ESPN")


    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")
    job_3= company.jobs.create!(title: "Marketing", level_of_interest: 80, city: "Boston")
    job_4 = company.jobs.create!(title: "Clown", level_of_interest: 70, city: "New York City")
    job_5 =company.jobs.create!(title: "Dog-walker", level_of_interest: 70, city: "New York City")
    job_6 = company.jobs.create!(title: "Trainer", level_of_interest: 70, city: "New York City")

    job_1.tags.create!(title: "Software")
    job_1.tags.create!(title: "Good-Location")
    job_2.tags.create!(title: "Software")
    job_3.tags.create!(title: "Software")
    job_4.tags.create!(title: "Good-Location")
    job_5.tags.create!(title: "Good-Location")
    job_6.tags.create!(title: "Software")

    visit company_job_path(company, job_1)


    expect(page).to have_content("Software - 4")
    expect(page).to have_content("Good-Location - 3")
  end

end
