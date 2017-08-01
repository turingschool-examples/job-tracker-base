require 'rails_helper'
  RSpec.describe "User visits specific job page" do

    scenario "sees tags associated with that job" do
      company = Company.create(name: "Xcel Energy")
      job = Job.create(title: 'Software Engineer', level_of_interest: 100, city: "Denver", salary: 90000, company_id: company.id)
      job.tags.create(title: "Computer")

      visit company_job_path(company, job)

      expect(page).to have_content("Computer")
    end

    scenario "sees a count of jobs for each tag" do
      company = Company.create(name: "Xcel Energy")
      tag = Tag.create(title: "Computer")
      job = Job.create(title: 'Software Engineer', level_of_interest: 100, city: "Denver", salary: 90000, company_id: company.id)
      job2 = Job.create(title: "Systems Architect", level_of_interest: 74, city: "Miami", salary: 120000, company_id: company.id)
      job.jobs_tags.create(tag: tag)
      job2.jobs_tags.create(tag: tag)

      visit company_job_path(company, job)

      expect(page).to have_content("Computer - 2")
    end

    scenario "sees average salary for tags" do
      company = Company.create(name: "Xcel Energy")
      tag = Tag.create(title: "Computer")
      job = Job.create(title: 'Software Engineer', level_of_interest: 100, city: "Denver", salary: 90000, company_id: company.id)
      job2 = Job.create(title: "Systems Architect", level_of_interest: 74, city: "Miami", salary: 120000, company_id: company.id)
      job.jobs_tags.create(tag: tag)
      job2.jobs_tags.create(tag: tag)

      visit company_job_path(company, job)

      expect(page).to have_content("(105000.0)")
    end
  end
