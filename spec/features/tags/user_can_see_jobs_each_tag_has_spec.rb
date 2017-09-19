require 'rails_helper'

RSpec.describe 'as a user' do
	it 'can visit a job show page and see how many jobs each tag is associated with' do
		company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 10)
		tag_1 = job.tags.create!(title: "Programming eh")
		tag_2 = job.tags.create!(title: "Management eh")
		job_2 = company.jobs.create!(title: "Super Developer", level_of_interest: 75, city: "Oklahoma", salary: 15)
    job_2.tags << tag_1
		visit company_job_path(company, job)
		
		expect(page).to have_content("Programming eh - 2")
		expect(page).to have_content("Management eh - 1")
	end
end