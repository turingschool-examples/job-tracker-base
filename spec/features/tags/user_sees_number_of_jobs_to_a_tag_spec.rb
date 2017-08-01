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

    job2 = Job.create(title: "SecondJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 20000)
    job2.tags << tag1
    job2.tags << tag2
    job2.tags << tag3

    job3 = Job.create(title: "ThirdJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 20000)
    job3.tags << tag1
    job3.tags << tag2
    visit(company_job_path(company, job))
    expect(page).to have_content("tags: Industrial (3)")
    expect(page).to have_content("Mechanics (2)")
  end
end
