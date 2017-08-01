require 'rails_helper'

RSpec.feature 'User visits a job show page' do
  let(:company) { Company.create!(name: 'Cherry Creek Mall') }
  let(:job_attributes) { {title: 'Janitor', description: 'Cleans stuff',
                           level_of_interest: 4, city: 'Denver', salary: 24000,
                           company_id: company.id} }
  let(:job2_attributes) { {title: 'Security Guard', description: 'Guards stuff',
                           level_of_interest: 3, city: 'Denver', salary: 25000,
                           company_id: company.id} }
  let(:job3_attributes) { {title: 'Parking Ambassador', description: 'Helps people park',
                           level_of_interest: 1, city: 'Denver', salary: 22000,
                           company_id: company.id} }
  let(:job) { Job.create!(job_attributes) }
  let(:job2) { Job.create!(job2_attributes) }
  let(:job3) { Job.create!(job3_attributes) }
  let(:tag1) { Tag.create!(name: 'Last Resort') }
  let(:tag2) { Tag.create!(name: 'I hope not') }
  let(:tag3) { Tag.create!(name: 'Only if I have to') }
  let(:tag4) { Tag.create!(name: 'Dream Job') }

  scenario 'and can add a tag to the job' do
    tag1
    visit company_job_path(company, job)

    select "#{tag1.name}", from: 'job[tag_ids]'
    click_on 'Add Tag'

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content tag1.name
  end

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

    expect(page).to have_content "#{tag1.name} - 2"
    expect(page).to have_content "#{tag2.name} - 1"
    expect(page).to have_content "#{tag3.name} - 1"
  end

  scenario 'and sees the average salary for each tag' do
    job.tags << [tag1, tag2, tag3]
    tag1.jobs << job2
    tag2.jobs << [job2, job3]

    visit company_job_path(company, job)

    expect(page).to have_content "#{tag1.name} - 2 (24500)"
    expect(page).to have_content "#{tag2.name} - 3 (23666)"
    expect(page).to have_content "#{tag3.name} - 1 (24000)"
  end
end
