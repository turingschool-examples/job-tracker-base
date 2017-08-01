require 'rails_helper'

RSpec.feature 'User visits a job show page' do
  scenario 'and sees all tags associated with that job' do
    company = Company.create!(name: 'Cherry Creek Mall')
    job_attributes = {
      title: 'Janitor',
      description: 'Cleans stuff',
      level_of_interest: 4,
      city: 'Denver',
      salary: 24000,
      company_id: company.id
    }
    job = Job.create!(job_attributes)

    tag1 = Tag.create!(name: 'Last Resort')
    tag2 = Tag.create!(name: 'I hope not')
    tag3 = Tag.create!(name: 'Only if I have to')
    tag4 = Tag.create!(name: 'Dream Job')

    job.tags << [tag1, tag2, tag3]

    visit job_path(job)

    expect(page).to have_content tag1.name
    expect(page).to have_content tag2.name
    expect(page).to have_content tag3.name
    expect(page).to_not have_content tag3.name
  end
end

# t.string   "title"
# t.string   "description"
# t.integer  "level_of_interest"
# t.datetime "created_at",        null: false
# t.datetime "updated_at",        null: false
# t.integer  "company_id"
# t.string   "city"
# t.integer  "salary"
# t.index ["company_id"], name: "index_jobs_on_company_id", using: :btree
