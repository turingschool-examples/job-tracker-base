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
  end
