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
    scenario "I also see a count of how many jobs have each specific tag listed" do
      company1 = Company.create(name: "company1")
      company2 = Company.create(name: "company2")
      job1 = company1.jobs.create(title: Faker::Job.title, description: "What a great position!", level_of_interest: 88, city: Faker::Address.city, salary: 80000)
      job2 = company2.jobs.create(title: Faker::Job.title, description: "What a great position!", level_of_interest: 76, city: Faker::Address.city, salary: 60000)
      tag1 = Tag.create(name: "industry1")
      tag2 = Tag.create(name: "industry2")
      job1.tags << [tag1, tag2]
      job2.tags << tag1

      visit company_job_path(company1, job1)

      expect(page).to have_content("There are 2 jobs with this tag")
      expect(page).to have_content("There are 1 jobs with this tag")
    end
    scenario "I also see an average salary for all jobs within each specific tag listed" do
      company1 = Company.create(name: "company1")
      company2 = Company.create(name: "company2")
      job1 = company1.jobs.create(title: Faker::Job.title, description: "What a great position!", level_of_interest: 88, city: Faker::Address.city, salary: 80000)
      job2 = company2.jobs.create(title: Faker::Job.title, description: "What a great position!", level_of_interest: 76, city: Faker::Address.city, salary: 60000)
      tag1 = Tag.create(name: "industry1")
      tag2 = Tag.create(name: "industry2")
      job1.tags << [tag1, tag2]
      job2.tags << tag1

      visit company_job_path(company1, job1)

      expect(page).to have_content("The average salary for jobs with this tag is $70000")
    end
  end
end
