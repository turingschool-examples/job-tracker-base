require 'rails_helper'

describe "User sees tags associated with specific job" do
  let!(:company)       { Company.create!(name: "ESPN")}
  let!(:job)           { company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver" )}
  let!(:cool_tag)      { job.tags.create(title: 'cool')}
  let!(:cool_cool_tag) { job.tags.create(title: 'cool cool')}
  let!(:suh_dude)      { job.tags.create(title: 'suh dude')}

  scenario "a user sees a job for a specific company" do

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("cool")
    expect(page).to have_content("cool cool")
    expect(page).to have_content("suh dude")
  end
end
