require "rails_helper"

describe "when a user visits show page" do
  it "sees all the tags belonging to that job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 80000)
    tag = job.tags.create(title: "Tech")
    tag_1 = job.tags.create(title: "Web")
    job_1 = company.jobs.create!(title: "Engineer", level_of_interest: 70, city: "New York", salary: 90000, tag_ids: [tag.id, tag_1.id])

    visit company_job_path(company, job)

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content('Tech')
    expect(page).to have_content('Web')
    expect(page).to have_content(2)
    expect(page).to have_content("$85,000.00")
  end

end
