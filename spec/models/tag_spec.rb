require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        tag = Tag.new(name: "Technology")
        expect(tag).to be_valid
      end
    end

    describe "associations" do
      it "has many jobs" do
        tag = Tag.new(name: "Technology")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver")

        tag.jobs << job

        expect(tag.jobs).to include(job)
        expect(tag).to respond_to(:jobs)
      end
    end

    describe ".job_count" do
      it "should return jobs count with this tag" do
        company = Company.create(name: "Dropbox")
        job_1 = company.jobs.create!(title: "Developer", level_of_interest: 80, description: "DevOps experience required", city: "Denver")
        job_2 = company.jobs.create!(title: "Developer", level_of_interest: 80, description: "IT experience required", city: "Denver")

        tag = job_1.tags.create(name: "Technology")
        expect(tag.job_count).to eq(1)

        job_2.tags << tag
        expect(tag.job_count).to eq(2)
      end
    end
  end
end
