require 'rails_helper'

RSpec.feature "When a user views a specific job page" do
  scenario "they see the name of each tag associated with that job" do
    company = Company.create!(name: "Enron")
    job = company.jobs.create!(title: "Lackey", description: "You'd be the fall guy", level_of_interest: 75, city: "Houston")
    tag1 = job.tags.create!(name: "Exciting")
    tag2 = job.tags.create!(name: "Intriguing")
    job.tags << [tag1, tag2]

    visit company_job_path(company, job)
    save_and_open_page
    expect(page).to have_content(tag1.name)
    expect(page).to have_content(tag2.name)

  end
end
