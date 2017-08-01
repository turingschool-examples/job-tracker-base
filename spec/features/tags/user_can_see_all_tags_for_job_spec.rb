require 'rails_helper'

RSpec.feature 'User visits a job show page' do
  let(:company) { Company.create!(name: 'Cherry Creek Mall') }
  let(:job_attributes) { {title: 'Janitor', description: 'Cleans stuff',
                          level_of_interest: 4, city: 'Denver', salary: 24000,
                          company_id: company.id} }
  let(:job2_attributes) { {title: 'Security Guard', description: 'Guards stuff',
                          level_of_interest: 3, city: 'Denver', salary: 25000,
                          company_id: company.id} }
  let(:job) { Job.create!(job_attributes) }
  let(:job2) { Job.create!(job2_attributes) }
  let(:tag1) { Tag.create!(name: 'Last Resort') }
  let(:tag2) { Tag.create!(name: 'I hope not') }
  let(:tag3) { Tag.create!(name: 'Only if I have to') }
  let(:tag4) { Tag.create!(name: 'Dream Job') }

  scenario 'and sees all tags associated with that job' do
    job.tags << [tag1, tag2, tag3]

    visit company_job_path(company, job)

    expect(page).to have_content tag1.name
    expect(page).to have_content tag2.name
    expect(page).to have_content tag3.name
    expect(page).to_not have_content tag4.name
  end

  scenario 'and sees the number of jobs for each tag' do
    job.tags << [tag1, tag2, tag3]
    tag1.jobs << job2

    visit company_job_path(company, job)
    save_and_open_page

    expect(page).to have_content "#{tag1.name} - 2"
    expect(page).to have_content "#{tag2.name} - 1"
    expect(page).to have_content "#{tag3.name} - 1"
  end
end
