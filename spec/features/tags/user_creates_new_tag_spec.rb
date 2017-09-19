require 'rails_helper'

RSpec.describe "User creates a new tag" do
  scenario "a user can create a new tag for a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver")
    tag = job.tags.create(title: "Software")
    visit job_path(job)
    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("Software")
  end
end
