require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do

    company = Company.create!(name: "ESPN")
    tag = Tag.create!(title: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 70000)
    job2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Chicago", salary: 90000)
    job_tag = JobTag.create!(job_id:job.id, tag_id:tag.id)
    job_tag2 = JobTag.create!(job_id:job2.id, tag_id:tag.id)


    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

    it "I see the name of each of the tags associated with that job." do
      visit company_job_path(company, job)
      expect(page).to have_content("Software")
    end

    it "I also see a count of how many jobs have each specific tag listed." do
      visit company_job_path(company, job)
      expect(page).to have_content("Software - 2")
    end

    it "I also see an average salary for all jobs within each specific tag listed." do
        visit company_job_path(company, job)
        expect(page).to have_content("Software - 2 (80000)")
    end

end
