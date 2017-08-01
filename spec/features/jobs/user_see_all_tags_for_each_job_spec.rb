require 'rails_helper'

RSpec.describe "User visits individual job page" do
  scenario "and sees all tags for that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    fill_in "tag[title]", with: "resume sent"
    click_on "Add Tag"
    fill_in "tag[title]", with: "interview scheduled"
    click_on "Add Tag"
    fill_in "tag[title]", with: "contacted"
    click_on "Add Tag"

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content "resume sent"
    expect(page).to have_content "interview scheduled"
    expect(page).to have_content "contacted"
  end
end
