#As a user,  When I visit a specific job page,
  #I also see an average salary for all jobs within each specific tag listed.

require 'rails_helper'
RSpec.describe "Average Salary" do
  it "a user sees average salary for all jobs for each specific tag" do

    company = Company.create(name: "Turning")
    job = company.jobs.create(title: "Ag", description: "work with plants", level_of_interest: 98, city: "Denver", salary: 10)
    job2 = company.jobs.create(title: "Space", description: "work with planets", level_of_interest: 95, city: "Denver", salary: 20)
    job3 = company.jobs.create(title: "Tech", description: "work with tech", level_of_interest: 90, city: "Denver", salary: 30)
    job4 = company.jobs.create(title: "Gov", description: "work with rocks", level_of_interest: 91, city: "Denver", salary: 40)


  end
end
