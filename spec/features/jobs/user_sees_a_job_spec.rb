require 'rails_helper'

describe "User sees a specific job" do

  before(:each) do
    @company = Company.create!(name: "ESPN")
    @job_1 = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    @tag_1 = @job_1.tags.create(name: "Sports")
    @tag_2 = @job_1.tags.create(name: "Entry Level")

    visit company_job_path(@company, @job_1)
  end

  scenario "a user sees a job for a specific company" do
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("Sports")
    expect(page).to have_content("Entry Level")
  end
end
