require 'rails_helper'

describe "User visits job page" do
  before(:each) do
    @tag1 = Tag.create!(name: "Great Location")
    @tag2 = Tag.create!(name: "Great Merntains")
    @tag3 = Tag.create!(name: "Great Pizza")

    @company = Company.create!(name: "ESPN")
    @job = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 100000)
    @job.tags << [@tag1, @tag2]

    @company2 = Company.create!(name: "Different")
    @job2 = @company2.jobs.create!(title: "Design", level_of_interest: 40, city: "Seattle", salary: 200000)
    @job2.tags << [@tag1, @tag2]

    @company3 = Company.create!(name: "Even Differenter")
    @job3 = @company3.jobs.create!(title: "Software", level_of_interest: 54, city: "Washington", salary: 90000)
    @job3.tags << [@tag1, @tag3]
  end

  scenario "a user sees all tags for specific job" do
    visit company_job_path(@company, @job)

    expect(page).to have_content(@job.tags.first.name)
    expect(page).to have_content(@job.tags.last.name)
    expect(page).to have_content(@job.title)
  end

  scenario "a user sees total tag count" do
    visit company_job_path(@company, @job)

    expect(page).to have_content("#{@job.tags.first.name} - 3")
    expect(page).to have_content("#{@job.tags.last.name} - 2")
    expect(page).to have_content(@job.title)
  end

  scenario "a user sees average salary for a tag" do
    visit company_job_path(@company, @job)

    expect(page).to have_content("#{@job.tags.first.name} - 3 (130000)")
    expect(page).to have_content("#{@job.tags.last.name} - 2 (100000)")
    expect(page).to have_content(@job.title)
  end
end
