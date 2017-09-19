require 'rails_helper'

RSpec.describe Tag do
  describe "Instance Methods" do
    it "returns count of jobs" do
      company = Company.create(name: "ESPN")
      job1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", salary: 100)
      job2 = company.jobs.create(title: "Software Engineer", level_of_interest: 60, city: "San Fran", salary: 200)
      tag1 = Tag.create(name: "Software")
      tag2 = Tag.create(name: "Coding")
      job1.tags = [tag1, tag2]
      job2.tags = [tag1, tag2]

      expect(tag1.count_of_jobs).to eq(2)
      expect(tag2.count_of_jobs).to eq(2)
    end

    it "returns average salary of jobs" do
      company = Company.create(name: "ESPN")
      job1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", salary: 100)
      job2 = company.jobs.create(title: "Software Engineer", level_of_interest: 60, city: "San Fran", salary: 200)
      tag1 = Tag.create(name: "Software")
      job1.tags = [tag1]
      job2.tags = [tag1]


      expect(tag1.average_salary).to eq(150)
    end
  end

end
