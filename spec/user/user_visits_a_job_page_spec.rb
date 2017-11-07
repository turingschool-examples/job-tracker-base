require 'rails_helper'

feature 'User visits a jobs show page' do
  before :each do
    company = Company.create(name: "Company")
    job = Job.create(title: "Job", description: "You do things", level_of_interest: 1, company: company, city: "Place", salary: 12)
    job2 = Job.create(title: "Job2", description: "You do different things", level_of_interest: 1, company: company, city: "Place", salary: 70)
    job.tags.create(name: "Cool")
    job.tags.create(name: "Not Cool")
    job.tags.create(name: "Hella Cool")
    job2.tags.create(name: "Cool")
    job2.tags.create(name: "Not Cool")
    job2.tags.create(name: "Hella Cool")

    visit "/companies/#{company.id}/jobs/#{job.id}"
  end

  it 'they see the name of the tags associated with that job' do
    expect(page).to have_content("Cool")
    expect(page).to have_content("Not Cool")
    expect(page).to have_content("Hella Cool")
  end

  it 'they see a count of all jobs related to that tag' do
    expect(page).to have_content("Number of jobs with this tag: 2")
  end

  it 'they see the average salary for all jobs in a specific tag' do
  end
end
# As a user,
# When I visit a specific job page,
# I see the name of each of the tags associated with that job.