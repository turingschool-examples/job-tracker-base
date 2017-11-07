require 'rails_helper'

describe JobTag do
  describe "class methods" do
    it ".count_per_job" do
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

      expect(JobTag.count_per_job(tag1.id)).to eq(2)
    end
  end
end
