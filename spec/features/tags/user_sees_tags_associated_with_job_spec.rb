require 'rails_helper'

describe "User visits a job page" do
  scenario "also sees tags associated with that job" do
    company = Company.create(name: "Pizza Planet")
    job = Job.create(title: "Cook", level_of_interest: 50, city: "Mars", salary: 35000, company_id: company.id)
    tag = job.tags.create(name: "Food")

    visit company_job_path(company.id, job.id)

    expect(page).to have_content("Pizza Planet")
    expect(page).to have_content("Cook")
    expect(page).to have_content("50")
    expect(page).to have_content("Food")
  end

  scenario "also sees how many jobs have the specific tag listed" do
    company = Company.create(name: "Pizza Planet")
    company2 = Company.create(name: "Electrical Planet")
    job = Job.create(title: "Cook", level_of_interest: 50, city: "Mars", salary: 35000, company_id: company.id)
    job2 = Job.create(title: "Electrician", level_of_interest: 70, city: "Saturn", salary: 45000, company_id: company2.id)
    tag = Tag.create(name: "Might be interesting")
    job.tags << tag
    job2.tags << tag


    visit company_job_path(company.id, job.id)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.city)
    expect(page).to have_content("Might be interesting - 2")
  end

  scenario "also sees average salary for all jobs with that tag" do
    company = Company.create(name: "Pizza Planet")
    company2 = Company.create(name: "Electrical Planet")
    job = Job.create(title: "Cook", level_of_interest: 50, city: "Mars", salary: 35000, company_id: company.id)
    job2 = Job.create(title: "Dishwasher", level_of_interest: -50, city: "Uranus", salary: 5000, company_id: company.id)
    job3 = Job.create(title: "Electrician", level_of_interest: 70, city: "Saturn", salary: 45000, company_id: company2.id)
    job4 = Job.create(title: "Laborer", level_of_interest: 10, city: "Pluto", salary: 15000, company_id: company2.id)
    tag = Tag.create(name: "Not sure")
    tag2 = Tag.create(name: "No thanks")
    job.tags << tag
    job.tags << tag2
    job3.tags << tag
    job2.tags << tag2
    job4.tags << tag2

    visit company_job_path(company.id, job.id)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.city)
    expect(page).to have_content("Not sure - 2 (40000), No thanks - 3 (18333)")
  end
end
