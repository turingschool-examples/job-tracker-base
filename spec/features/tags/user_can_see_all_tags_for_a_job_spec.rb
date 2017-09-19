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
			tag1 = job.tags.create(name: "Cool")
			tag2 = job.tags.create(name: "Classic Sal")
			tag3 = job.tags.create(name: "Code")

			visit company_job_path(company, job)

			expect(page).to have_content("Cool")
			expect(page).to have_content("Classic Sal")
			expect(page).to have_content("Code")
		end

		scenario "and can see the number of jobs associated with each tag" do
			company = Company.create(name: "Turing")
			job1 = Job.create(title: "Teacher",
											 description: "Teaches things",
											 level_of_interest: 49,
											 company_id: company.id,
											 city: "Denver",
											 salary: 1000000)
			job2 = Job.create(title: "Pizza Guy",
											 description: "Delivers Pizza",
											 level_of_interest: 5,
											 company_id: company.id,
											 city: "Denver",
											 salary: 55555)
			job3 = Job.create(title: "Student",
											 description: "Learns things",
											 level_of_interest: 49,
											 company_id: company.id,
											 city: "Denver",
											 salary: 1)
			job4 = Job.create(title: "Accountant",
											 description: "Counts things",
											 level_of_interest: 3,
											 company_id: company.id,
											 city: "Denver",
											 salary: 99999)
			tag1 = Tag.create(name: "Cool")
			tag2 = Tag.create(name: "Classic Sal")
			tag3 = Tag.create(name: "Code")

			JobsTag.create(job_id: job1.id, tag_id: tag1.id)
			JobsTag.create(job_id: job1.id, tag_id: tag2.id)
			JobsTag.create(job_id: job1.id, tag_id: tag3.id)
			JobsTag.create(job_id: job2.id, tag_id: tag1.id)
			JobsTag.create(job_id: job2.id, tag_id: tag2.id)
			JobsTag.create(job_id: job3.id, tag_id: tag1.id)

			visit company_job_path(company, job1)

			expect(page).to have_content("3 other job(s) with this tag")
			expect(page).to have_content("2 other job(s) with this tag")
			expect(page).to have_content("1 other job(s) with this tag")
		end
	end
end

# As a user,
# When I visit a specific job page,
# I also see a count of how many jobs have each specific tag listed.