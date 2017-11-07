require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user sees the tags for each job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job.tags.create(title: "FE")
    job.tags.create(title: "BE")
    job.tags.create(title: "Full Stack")

    visit company_job_path(company, job)

    expect(page).to have_content("FE")
    expect(page).to have_content("BE")
    expect(page).to have_content("Full Stack")

  end

  scenario "user sees how many jobs have each specific tag listed" do
    #does this mean on 1 show page, I list all the other jobs that share the same tags?
    company = Company.create(name: "ESPN")
    job_1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver")
    job_1.tags.create(title: "FE")
    job_1.tags.create(title: "BE")
    job_1.tags.create(title: "Full Stack")

    job_2 = company.jobs.create(title: "Also Developer", level_of_interest: 50, city: "Denver")
    job_2.tags.create(title: "BE")
    job_2.tags.create(title: "Full Stack")

    job_3 = company.jobs.create(title: "Also Also Developer", level_of_interest: 20, city: "Denver")
    job_3.tags.create(title: "Full Stack")

    visit company_job_path(company, job_1)

    expect(page).to have_content("Other Jobs Tagged with FE: 1")
    expect(page).to have_content("Other Jobs Tagged with BE: 2")
    expect(page).to have_content("Other Jobs Tagged with Full Stack: 3")
  end

end
