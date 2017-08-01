require 'rails_helper'

describe "User sees average salar for tag" do
  scenario "user sees average salary associated with a tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer",
                              level_of_interest: 70,
                              city: "Denver")
    job2 = company.jobs.create!(title: "Coder",
                              level_of_interest: 80,
                              city: "NY")
    job3 = company.jobs.create!(title: "Drive",
                              level_of_interest: 20,
                              city: "Boston")

    tag1 = Tag.create(title: "Jobs", average_salary: 75000)

    Tagging.create(job_id: job1.id, tag_id: tag1.id)
    Tagging.create(job_id: job2.id, tag_id: tag1.id)
    Tagging.create(job_id: job3.id, tag_id: tag1.id)

    visit company_job_path(company, job1)

    expect(page).to have_content(3)
    expect(page).to have_content(tag1.average_salary)

  end
end
