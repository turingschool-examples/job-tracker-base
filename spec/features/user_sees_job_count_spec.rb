#As a user, When I visit a specific job page,
  #I also see a count of how many jobs have each specific tag listed.

require 'rails_helper'
RSpec.describe "Tag Count" do
it "a user sees total tag count" do
    company = Company.create(name: "Turing")
    job = company.jobs.create(title: "Ag", description: "work with plants", level_of_interest: 98, city: "Denver", salary: 1)
    #tag1 =job.tags.create(name: "hot job")
    #tag2 = job.tags.create(name: "going soon")

    #visit company_job_page(company, job)
    #expect(page).to have_content(tag1.name)
    #expect(page).to have_content(tag2.name)
    #expect(page).to have_content("2")
  #end
end
end

