require 'rails_helper'

describe 'User visits specific job page' do
  scenario 'user sees each of the tags associated with that job' do
    company = Company.create(name: 'alkajsdlkjlk')
    job = Job.create(title: 'stuff doer', description: 'you do stuff', level_of_interest: 8, city: 'city', salary: 10)
    tag = Tag.create(title: 'super cool')

    visit ("/companies/#{company.id}/jobs/#{job.id}")

    save_and_open_page

    expect(page).to have_content("Title: stuff doer")
    expect(page).to have_content("Description: you do stuff")
    expect(page).to have_content("Level of Interest: 8")
    expect(page).to have_content("City: city")
    expect(page).to have_content("Company: alkajsdlkjlk")
    expect(page).to have_content("Tags: super cool")

  end
end

# As a user,
# When I visit a specific job page,
# I see the name of each of the tags associated with that job.
