require 'rails_helper'

RSpec.describe JobTag, type: :model do
  describe "relationships" do
    it "belongs to a job" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      tag = Tag.create!(name: "Sports")

      job_tag = JobTag.new(job: job, tag: tag)

      expect(job_tag).to respond_to(:job)
    end

    it "belongs to a tag" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      tag = Tag.create!(name: "Sports")

      job_tag = JobTag.new(job: job, tag: tag)

      expect(job_tag).to respond_to(:tag)
    end
  end
end
