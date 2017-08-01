require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "class methods" do
    it "can calculate total jobs associated with specific tag" do
      tag1 = Tag.create(name: "Industrial")
      tag2 = Tag.create(name: "Mechanics")
      company = Company.create(name: "CompanyTitle")
      job = Job.create(title: "JobTitle", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 20000)
      job.tags << tag1
      job.tags << tag2
      job2 = Job.create(title: "SecondJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 20000)
      job2.tags << tag1
      job3 = Job.create(title: "ThirdJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 20000)
      job3.tags << tag1
      job3.tags << tag2
      expect(tag1.job_count).to eq(3)
      expect(tag2.job_count).to eq(2)
    end

    it "can calculate average salary of associated jobs" do
      tag1 = Tag.create(name: "Industrial")
      company = Company.create(name: "CompanyTitle")
      job = Job.create(title: "JobTitle", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 10050)
      job.tags << tag1
      job2 = Job.create(title: "SecondJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 49950)
      job2.tags << tag1
      job3 = Job.create(title: "ThirdJob", description: "tough job", level_of_interest: 20, company_id: company.id, city: "Denver", salary: 90000)
      job3.tags << tag1

      expect(tag1.average_salary).to eq(50000)
    end
  end
end
