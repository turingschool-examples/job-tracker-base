require 'rails_helper'

RSpec.feature "When a user views a specific job page" do
  before(:each) do
    @company = Company.create!(name: "Enron")
    @job = @company.jobs.create!(title: "Lackey", description: "You'd be the fall guy", salary: 25000, level_of_interest: 75, city: "Houston")
    @job2 = @company.jobs.create!(title: "CEO", description: "Make all the money", salary: 1000000, level_of_interest: 100, city: "Houston")

    @company2 = Company.create!(name: "World Peace")
    @job3 = @company2.jobs.create!(title: "Attorney", description: "Chase the bad guys", salary: 40000, level_of_interest: 10, city: "New York")

    @tag1 = @job.tags.create!(name: "Exciting")
    @tag2 = @job.tags.create!(name: "Intriguing")
    @tag3 = Tag.create!(name: "Boring")
  end

  scenario "they see the name of each tag associated with that job" do

    visit company_job_path(@company, @job)

    expect(page).to have_content(@tag1.name)
    expect(page).to have_content(@tag2.name)
    expect(page).to_not have_content(@tag3.name)
  end

  scenario "they see a job count for each tag" do

    @job2.tags << [@tag1]
    @job3.tags << [@tag3]

    visit company_job_path(@company, @job)

    expect(page).to have_content(@tag1.count)
    expect(page).to have_content(@tag2.count)
    expect(@tag1.count).to eq(2)
    expect(@tag2.count).to eq(1)
  end

  scenario "they see the average salary of a tag's jobs" do
    @job2.tags << [@tag1]

    visit company_job_path(@company, @job)

    expect(page).to have_content(@tag1.salaries)
    expect(page).to have_content(@tag2.salaries)
    expect(@tag1.salaries).to eq(512500)
    expect(@tag2.salaries).to eq(25000)
  end
end
