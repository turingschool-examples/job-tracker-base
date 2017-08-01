require 'rails_helper'

RSpec.describe "User visits individual job page" do
  scenario "and sees the average salary for each tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 80000)
    job2 = company.jobs.create!(title: "Office Manager", level_of_interest: 70, city: "Denver", salary: 55000)

    tag1 = job1.tags.create!(title: "Wizard")
    tag2 = job1.tags.create!(title: "Development")
    tag3 = job2.tags.create!(title: "Management")

    job2.tags << tag2

    visit company_job_path(company, job1)
save_and_open_page
    expect(page).to have_content tag1.average_salary
    expect(page).to have_content tag2.average_salary

    expect(tag1.average_salary).to eq 80000
    expect(tag2.average_salary).to eq 67500
  end
end
