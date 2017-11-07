require 'rails_helper'

describe "User sees a specific job" do

  before(:each) do
    @company = Company.create!(name: "ESPN")
    @job_1 = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    @tag_1 = @job_1.tags.create(name: "Sports")
    @tag_2 = @job_1.tags.create(name: "Entry Level")

    @job_2 = @tag_1.jobs.create(title: "Product Manager", level_of_interest: 10, city: "Denver", company: @company)
    @job_3 = @tag_1.jobs.create(title: "Code Monkey", level_of_interest: 99, city: "Denver", company: @company)

    @job_4 = @tag_2.jobs.create(title: "Code Monkey", level_of_interest: 95, city: "Seattle", company: @company)
    @job_5 = @tag_2.jobs.create(title: "Junior Developer", level_of_interest: 90, city: "Seattle", company: @company)
    @job_6 = @tag_2.jobs.create(title: "Director", level_of_interest: 85, city: "Seattle", company: @company)

    visit company_job_path(@company, @job_1)
  end

  scenario "a user sees a job for a specific company" do
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user sees a job's tags, the number of jobs associated with that tag, and average salary for that tag" do
    expect(page).to have_content("Sports - 3 ($100,000.00)")
    expect(page).to have_content("Entry Level - 4 ($75,000.00)")
  end

end
