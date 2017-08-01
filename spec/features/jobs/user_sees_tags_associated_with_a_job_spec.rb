require 'rails_helper'

describe "User sees a all tags associated with job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer",
                              level_of_interest: 70,
                              city: "Denver")

    tag1 = Tag.create(title: "Admin")
    tag2 = Tag.create(title: "Education")
    tag3 = Tag.create(title: "Business")

    Tagging.create(jobs_id: job.id, tags_id: tag1.id)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content(tag1.title)
    expect(page).to_not have_content(tag1.title)
    expect(page).to have_content(tag3.title)
  end
end

#
# As a user,
# When I visit a specific job page,
# I see the name of each of the tags associated with that job.
