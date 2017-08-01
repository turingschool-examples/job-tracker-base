require 'rails_helper'

RSpec.feature "user visits individual job page" do
  scenario "and sees associated tags" do
    tag1 = Tag.create(name: "Industrial")
    tag2 = Tag.create(name: "In demand now!")
    tag3 = Tag.create(name: "Mechanics")
    company = Company.create(name: "CompanyTitle")
    job = Job.create(title: "JobTitle", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 20000)

    visit(company_job_path(company, job))
    save_and_open_page
  end
end
