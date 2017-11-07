require "rails_helper"

describe "When a user looks at a job page" do
  it " they see all the tags associated with that job" do
    company = Company.create(name: "Papa John's Pizza")
    free_food = Tag.create(title: "Free Food")
    flexible = Tag.create(title: "Flexible Hours")

    job = company.jobs.create(title: "Software Developer", description: "develop software",
                    level_of_interest: 5, city: "Denver", salary: 75000, tag_id: flexible.id)
    visit company_job_path(company, job)

    expect(page).to have_content("Software Developer")
    expect(page).to have_content("Free Food")
    expect(page).to have_content("Flexible Hours")
  end
 end
