require 'rails_helper'

feature 'User visits a jobs show page' do
  before :each do
    company = Company.create(name: "Company")
    job = Job.create(title: "Job", description: "You do things", level_of_interest: 1, company: company, city: "Place", salary: 12)
    @tag1 = job.tags.create(name: "Cool")
    @tag2 = job.tags.create(name: "Not Cool")
    @tag3 = job.tags.create(name: "Hella Cool")
    job2 = Job.create(title: "Job2", description: "You do different things", level_of_interest: 1, company: company, city: "Place", salary: 70, tags: [@tag1, @tag2, @tag3])

    visit "/companies/#{company.id}/jobs/#{job.id}"
  end

  it 'they see the name of the tags associated with that job' do
    expect(page).to have_content("Tag: Cool")
    expect(page).to have_content("Tag: Not Cool")
    expect(page).to have_content("Tag: Hella Cool")
  end

  it 'they see a count of all jobs related to that tag' do
    expect(page).to have_content("Number of jobs with the tag: 2")
  end

  it 'they see the average salary for all jobs in a specific tag' do
    expect(page). to have_content("Average Salary of job with this tag: 41")
  end
end