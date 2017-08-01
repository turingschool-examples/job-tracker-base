require 'rails_helper'

RSpec.feature "When a user views a specific job page" do
  before(:each) do
    @company = Company.create!(name: "Enron")
    @job = @company.jobs.create!(title: "Lackey", description: "You'd be the fall guy", level_of_interest: 75, city: "Houston")
    @tag1 = @job.tags.create!(name: "Exciting")
    @tag2 = @job.tags.create!(name: "Intriguing")
    @tag3 = Tag.create!(name: "Intriguing")
  end
  scenario "they see the name of each tag associated with that job" do

    visit company_job_path(@company, @job)
    save_and_open_page
    expect(page).to have_content(@tag1.name)
    expect(page).to have_content(@tag2.name)
  end

  scenario "they see a job count for each tag" do
    job2 = @company.jobs.create!(title: "CEO", description: "Make all the money", level_of_interest: 100, city: "Houston")
    company2 = Company.create!(name: "World Peace")
    job3 = company2.jobs.create!(title: "Attoryney", description: "Chase the bad guys", level_of_interest: 10, city: "New York")

    job2.tags << [@tag1]
    job3.tags << [@tag3]

    visit company_job_path(@company, @job)
  end
end
