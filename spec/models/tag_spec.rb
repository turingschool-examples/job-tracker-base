require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "Relationships" do
    it { should have_many(:job_tags) }
    it { should have_many(:jobs) }
  end

  context "Method Tests" do
    it "should return proper job count" do
      company = Company.create(name: "company")
      job_1 = Job.create(title: "chief of awesome",
                       description: "awesomeness",
                       level_of_interest: 34,
                       company: company,
                       city: "Denver",
                       salary: 10000.00)
      job_2 = Job.create(title: "chief of sad path",
                       description: "sadness",
                       level_of_interest: 24,
                       company: company,
                       city: "Boulder",
                       salary: 20000.00)
      tag_1 = Tag.create(name: "engineering")
      JobTag.create(job_id: job_1.id, tag_id: tag_1.id)
      JobTag.create(job_id: job_2.id, tag_id: tag_1.id)

      expected = 2
      result = tag_1.job_count

      expect(expected).to eq(result)
    end

    it "should return average salary" do
      company = Company.create(name: "company")
      job_1 = Job.create(title: "chief of awesome",
                       description: "awesomeness",
                       level_of_interest: 34,
                       company: company,
                       city: "Denver",
                       salary: 10000.00)
      job_2 = Job.create(title: "chief of sad path",
                       description: "sadness",
                       level_of_interest: 24,
                       company: company,
                       city: "Boulder",
                       salary: 20000.00)
      tag_1 = Tag.create(name: "engineering")
      JobTag.create(job_id: job_1.id, tag_id: tag_1.id)
      JobTag.create(job_id: job_2.id, tag_id: tag_1.id)

      expected = 15000
      result = tag_1.avg_salary

      expect(expected).to eq(result)
    end
  end
end
