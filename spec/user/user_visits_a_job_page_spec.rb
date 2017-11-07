require 'rails_helper'

feature 'User visits a jobs show page' do
  it 'they see the name of the tags associated with that job' do
    company = Company.create(name: "Company")
    job = Job.create(title: "Job", description: "You do things", level_of_interest: 1, company: company, city: "Place", salary: 12)
    Tag.create(name: "Cool", job: job)
    Tag.create(name: "Not Cool", job: job)
    Tag.create(name: "Hella Cool", job: job)

    visit "/companies/#{company.id}/jobs/#{job.id}"

    expect(page).to have_content("Cool")
    expect(page).to have_content("Not Cool")
    expect(page).to have_content("Hella Cool")
  end

  it 'they see a count of all jobs related to that tag' do
  end
end
# As a user,
# When I visit a specific job page,
# I see the name of each of the tags associated with that job.