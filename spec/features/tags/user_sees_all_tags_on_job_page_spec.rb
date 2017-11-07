require 'rails_helper'

describe "User sees tags on job page" do
  scenario 'user sees all tags for that job' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 100000)
    tag = company.jobs.last.tags.create!(name: "Sports Entertainment")

    visit company_job_path(company, job)
    save_and_open_page
    expect(page).to have_content("Tags:")
    expect(page).to have_content("Sports Entertainment")
    expect(page).to have_content("1")
    expect(page).to have_content("$100,000")
  end

  scenario 'user sees all tags for that job' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Senior Developer", level_of_interest: 70, city: "Denver", salary: 200000)
    job2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 100000)
    tag = Tag.create(name: "Sports Entertainment")
    tag2 = Tag.create(name: "Nonsense")
    job.job_tags.create(tag: tag)
    job.job_tags.create(tag: tag2)
    job2.job_tags.create(tag: tag)

    visit company_job_path(company, job2)

    expect(page).to have_content("Tags:")
    expect(page).to have_content("Sports Entertainment")
    expect(page).to have_content("$200,000")
    expect(page).to have_content("2")
    expect(page).to have_content("Nonsense")
    expect(page).to have_content("1")
    expect(page).to have_content("$150,000")
  end
end