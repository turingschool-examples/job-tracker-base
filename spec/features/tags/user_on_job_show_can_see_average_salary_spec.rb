require 'rails_helper'

RSpec.describe 'as a user' do
	it 'can visit a job show page and see how many jobs each tag is associated with' do
		company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 3)
		tag_1 = job.tags.create!(title: "Programming eh")
		job_2 = company.jobs.create!(title: "Super Developer", level_of_interest: 75, city: "Oklahoma", salary: 2)
		job_2.tags << tag_1
		company_2= Company.create!(name: "Derp factory")
    job_3 = company_2.jobs.create!(title: "dumb", level_of_interest: 70, city: "Denver", salary: 6)
		tag_2 = job_3.tags.create(title: "Management eh")
		job_4 = company_2.jobs.create!(title: "idiot Developer", level_of_interest: 75, city: "Oklahoma", salary: 10)
		job_4.tags << tag_2
		job_5 = company_2.jobs.create!(title: "idiot Developer", level_of_interest: 75, city: "Oklahoma", salary: 8)
		job_5.tags << tag_2
		visit company_job_path(company, job)
		
		expect(page).to have_content("(2.5)")
		visit company_job_path(company_2, job_3)
		expect(page).to have_content("(8.0)")
	end
end