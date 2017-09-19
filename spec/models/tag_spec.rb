require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "relationships" do
    it "has_many jobs" do
      tag = Tag.new(name: "good tag")
      expect(tag).to respond_to(:jobs)
    end
  end

  describe "Methods" do
  	it ".avg_salary" do
  		company = Company.create(name: "Turing")

			job1 = Job.create(title: "Teacher",
											 description: "Teaches things",
											 level_of_interest: 49,
											 company_id: company.id,
											 city: "Denver",
											 salary: 10)
			job2 = Job.create(title: "Pizza Guy",
											 description: "Delivers Pizza",
											 level_of_interest: 5,
											 company_id: company.id,
											 city: "Denver",
											 salary: 20)
			job3 = Job.create(title: "Student",
											 description: "Learns things",
											 level_of_interest: 49,
											 company_id: company.id,
											 city: "Denver",
											 salary: 30)

			tag1 = Tag.create(name: "Cool")

			JobsTag.create(job_id: job1.id, tag_id: tag1.id)
			JobsTag.create(job_id: job2.id, tag_id: tag1.id)
			JobsTag.create(job_id: job3.id, tag_id: tag1.id)

			expect(tag1.avg_salary).to eq(20)
  	end
  end
end
