require 'rails_helper'
  RSpec.describe "User visits specific job page" do
    scenario "sees tags associated with that job" do
      tag = Tag.create(title: "Computer")
      company = Company.create(name: "Xcel Energy")
      job = Job.create(title: 'Software Engineer', level_of_interest: 100, city: "Denver", company_id: company.id)

      visit company_job_path(company, job)
      save_and_open_page
      expect(page).to have_content(tag.title)
    end

    scenario "sees a count of jobs for each tag" do
      # As a user,
      company = Company.create(name: "Xcel Energy")
      job = Job.create(title: 'Software Engineer', level_of_interest: 100, city: "Denver", company_id: company.id)
      job2 = Job.create(title: "Systems Architect", level_of_interest: 74, city: "Miami", company_id: company.id)
      job.tags.create(title: "Computer")
      job2.tags.create(title: "Computer")
      visit company_job_path(company, job)

      expect(page).to have_content("#{tag.title} - 2")
    end
  end
