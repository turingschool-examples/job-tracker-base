require 'rails_helper'

RSpec.feature "When a user views a specific job page" do
  scenario "they see the name of each tag associated with that job" do
    company = Company.create!(name: "Enron")
    job = company.jobs.create!(title: "Lackey", description: "You'd be the fall guy", level_of_interest: 75, city: "Houston")
    tag1 = Tag.create!(name: "Exciting")
    tag2 = Tag.create!(name: "Intriguing")
    job.tags << [tag1, tag2]

    visit company_jobs_path(company, job)

    expect(page).to have_content(tag1.name)
    expect(page).to have_content(tag2.name)

  end
end
