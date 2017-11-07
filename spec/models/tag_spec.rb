require 'rails_helper'

describe Tag do
  describe "validations" do
    context "Valid attributes" do
    it "is valid" do
      tag = Tag.new(name: "Tech")
      expect(tag).to be_valid
    end
    end
  end

  describe "instance methods" do
    it "#average salary" do
      company = Company.create!(name: "ESPN")
      job1 = company.jobs.create!(title: "Developer",
                                  level_of_interest: 70,
                                  city: "Denver",
                                  salary: 60000)
      job2 = company.jobs.create!(title: "Software Engineer",
                                  level_of_interest: 80,
                                  city: "Dallas",
                                  salary: 80000)
      tag1 = Tag.create!(name: "Tech")
      JobTag.create(job: job1, tag: tag1)
      JobTag.create(job: job2, tag: tag1)

      expect(tag1.average_salary).to eq(70000)
    end
  end
end
