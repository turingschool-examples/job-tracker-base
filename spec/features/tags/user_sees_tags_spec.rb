require 'rails_helper'
  RSpec.describe "User visits specific job page" do
    scenario "sees tags associated with that job" do
      # As a user,
      tag = Tag.create(title: "Software")
      company = Company.create(name: "Xcel Energy")
      job = Job.create(title: 'Software Engineer', level_of_interest: 100, city: "Denver", company_id: company.id)
      # When I visit a specific job page,
      visit company_job_path(company, job)
      # I see the name of each of the tags associated with that job.
      expect(page).to have_content(tag.title)
    end
  end
