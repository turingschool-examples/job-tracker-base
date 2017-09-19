require 'rails_helper'

describe "User can see all tags for a job" do
	context "user can visit job page" do
		scenario "and can see all tags associated" do
			company = Company.create(name: "Turing")
			job = Job.create(title: "Teacher",
											 description: "Teaches things",
											 level_of_interest: 49,
											 company_id: company.id,
											 city: "Denver",
											 salary: 1000000)
			tag1 = Job.tags.create(name: "Cool")
			tag2 = Job.tags.create(name: "Classic Sal")
			tag3 = Job.tags.create(name: "Code")

			visit company_job_page(company, job)

			expect(page).to have_content("Cool")
			expect(page).to have_content("Classic Sal")
			expect(page).to have_content("Code")
		end
	end
end

# As a user,
# When I visit a specific job page,
# I see the name of each of the tags associated with that job.