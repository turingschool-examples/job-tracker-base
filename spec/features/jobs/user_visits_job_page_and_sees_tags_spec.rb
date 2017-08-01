require 'rails_helper'

RSpec.feature "user visits individual job page" do
  scenario "and sees associated tags" do
    tag1 = Tag.create(name: "Industrial")
    tag2 = Tag.create(name: "In demand now!")
    tag3 = Tag.create(name: "Mechanics")
    company = Company.create(name: "CompanyTitle")
    job = Job.create(title: "JobTitle", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 20000)
    job.tags << tag1
    job.tags << tag3

    visit(company_job_path(company, job))
    expect(page).to have_content(tag1.name)
    expect(page).to have_content(tag3.name)
    expect(page).to_not have_content(tag2.name)
  end
end
