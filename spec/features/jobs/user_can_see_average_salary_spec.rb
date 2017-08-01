require 'rails_helper'

RSpec.feature "user visits job show page" do
  scenario "and sees average_salary for each tag" do
    tag1 = Tag.create(name: "Industrial")
    tag2 = Tag.create(name: "Mechanical")
    company = Company.create(name: "CompanyTitle")
    job = Job.create(title: "JobTitle", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 10050)
    job.tags << tag1
    job.tags << tag2
    job2 = Job.create(title: "SecondJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 49950)
    job2.tags << tag1
    job3 = Job.create(title: "ThirdJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 90000)
    job3.tags << tag1
    job3.tags << tag2

    expect(tag1.average_salary).to eq(50000)
    expect(tag2.average_salary).to eq(50025)

    visit(company_job_path(company, job))
    expect(page).to have_content("($50000.00)")
    expect(page).to have_content("($50025.00)")
  end
end
