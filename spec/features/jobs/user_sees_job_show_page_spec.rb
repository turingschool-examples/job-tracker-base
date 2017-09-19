require 'rails_helper'

describe "As a user, I visit a specific job page," do

  company = Company.create!(name: "ESPN")
  tag = Tag.create!(title: "Software")
  job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
  job2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Chicago")
  job_tag = JobTag.create!(job_id:job.id, tag_id:tag.id)
  job_tag2 = JobTag.create!(job_id:job2.id, tag_id:tag.id)

    it "I see the name of each of the tags associated with that job." do
      visit company_job_path(company, job)
      expect(page).to have_content("Software")
    end

    it "I also see a count of how many jobs have each specific tag listed." do
      visit company_job_path(company, job)
      expect(page).to have_content("Software jobs: 2")
  end

end
