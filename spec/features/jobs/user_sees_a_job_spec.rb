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

  context "a user sees tags for a specific job" do
    before do
      company = Company.create!(name: "ESPN")
      job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 80000)
      job2 = company.jobs.create!(title: "Technician", level_of_interest: 50, city: "Longmont", salary: 40000)
      tag1 = job1.tags.create!(title: "Software")
      job1.tags.create!(title: "Far Away")
      job2.tags << tag1

      visit company_job_path(company, job1)
    end
    
    scenario "a user sees the title of the tag" do
      expect(page).to have_content("Software")
      expect(page).to have_content("Far Away")
    end

    scenario "a user sees count of jobs for each tag" do
      expect(page).to have_content(2)
      expect(page).to have_content(1)
    end

    scenario "a user sees the average salary for all jobs" do
      expect(page).to have_content(80000)
      expect(page).to have_content(60000)
    end
  end
end
