require 'rails_helper'

RSpec.feature "User can see average salary by tag" do
  scenario "and view that salary" do
    company = Company.create(name: "Nike")
    job = Job.create!(title: "Analyst", description: "Awesome job", level_of_interest: 1, company_id: company.id, city: "Los", salary: 500)
     job2 = Job.create!(title: "Aaccountant", description: "Awesome job", level_of_interest: 1, company_id: company.id, city: "Los", salary: 500)
    tag = job.tags.create(title: "Set up interview")
    tag2 = job.tags.create(title: "Callback")
    job2.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content("100,000")

  end
end
