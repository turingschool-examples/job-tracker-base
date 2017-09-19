require "rails_helper"

describe "User visits a job's show page" do
  scenario "a user sees a job count associated with each tag" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    job.tags.create(title: "Tech")
    job.tags.create(title: "Mountain")

    Tag.first.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver")
    Tag.first.jobs.create(title: "Developer", level_of_interest: 80, city: "Denver")

    Tag.last.jobs.create(title: "Saiyan", level_of_interest: 9001, city: "Vegeta")

    visit company_job_path(company, job)

    expect(page).to have_content("Tech")
    expect(page).to have_content(3)

    expect(page).to have_content("Mountain")
    expect(page).to have_content(2)
  end
end
