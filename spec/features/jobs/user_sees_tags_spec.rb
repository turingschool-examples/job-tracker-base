require 'rails_helper'

feature "As a user" do
  context "When I visit a specific job page" do
    scenario "I see the name of each of the tags associated with that job" do
      company = Company.create(name: "company1")
      job = company.jobs.create(title: Faker::Job.title, description: "What a great position!", level_of_interest: 88, city: Faker::Address.city, salary: 80000)
      tag1 = Tag.create(name: "industry1")
      tag2 = Tag.create(name: "industry2")
      job.tags << [tag1, tag2]

      visit company_job_path(company, job)

      expect(page).to have_content(tag1.name)
      expect(page).to have_content(tag2.name)
    end
  end
end
