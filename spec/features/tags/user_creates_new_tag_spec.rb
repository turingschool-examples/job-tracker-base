require 'rails_helper'

describe "User creates a new tag" do
  scenario "a user can create a new tag for a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver")

    visit job_path(job)

    click_on "Create New Tag"
    expect(current_path).to eq(new_job_tag_path(job))

    fill_in "tag[title]", with: "Software"

    click_button "Create"

    expect(current_path).to eq(job_tags_path(job))
    expect(page).to have_content("Software")
  end
end
