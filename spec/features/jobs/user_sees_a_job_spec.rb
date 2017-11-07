require 'rails_helper'

feature "When a user sees a specific job" do

  background do
    company = Company.create!(id: 1, name: "ESPN")
    company.jobs.create!(id: 1,
      title: "Developer",
      level_of_interest: 70,
      city: "Denver",
      salary: 9,
    )
  end

  scenario "they see the details of that job" do
    visit company_job_path(1, 1)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("$9")
  end

  scenario "they see the tags for that job inc. name, job count, and mean salary" do
    red = Tag.create!(name: "red", job_id: 1)
    blue = Tag.create!(name: "blue", job_id: 1)
    blue.jobs.create!(title: "x", level_of_interest: 1, city: "x", salary: 1)
    visit company_job_path(company, job)

    expect(page).to have_content("red - 1 (9)")
    expect(page).to have_content("blue - 2 (5)")
  end

end
