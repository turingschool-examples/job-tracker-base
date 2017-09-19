require 'rails_helper'

RSpec.describe "User creates a new tag" do
  scenario "a user can create a new tag for a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver")
    job_2 = company.jobs.create(title: "Analyst", description: "So fun!", level_of_interest: 80, city: "Denver")
    tag_1 = job.tags.create(title: "software")
    tag_2 = job.tags.create(title: "good location")
    tag_2 = job_2.tags.create(title: "good location")

    visit job_path(job)

    expect(page).to have_content("software: 1")
    expect(page).to have_content("good location: 2")
  end
end
