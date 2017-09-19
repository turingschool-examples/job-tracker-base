require 'rails_helper'

describe 'User visits a specific job page' do
  scenario 'user sees a count of how many jobs have a specific tag' do
    company = Company.create(id: 12, name: 'we do stuff here')
    job = Job.create(title: 'stuff doer', description: 'you do stuff', level_of_interest: 8, city: 'city', salary: 10, company_id: 12)

    visit ("/companies/#{company.id}/jobs/#{job.id}")

    
  end
end


# As a user,
# When I visit a specific job page,
# I also see a count of how many jobs have each specific tag listed.
