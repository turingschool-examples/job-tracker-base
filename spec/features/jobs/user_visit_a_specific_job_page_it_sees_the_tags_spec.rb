require "rails_helper"

describe "when a user visits show page" do
  it "sees all the tags belonging to that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    

  end

end
