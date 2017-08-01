require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new()
        expect(tag).to be_invalid
      end

      it "has a unique name" do
        tag_1 = Tag.create(name: "Tag 1")
        tag_2 = Tag.new(name: "Tag 1")
        expect(tag_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        tag = Tag.new(name: "Tag")
        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(name: "Tag")
      expect(tag).to respond_to(:jobs)
    end
  end

  describe "methods" do
    it "its jobs have an average salary" do
      tag = Tag.new(name: "Tag")

      company = Company.create!(name: "ESPN")
      company_2 = Company.create!(name: "Sports Authority")
      company_3 = Company.create!(name: "FedEx")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 70000)
      job_2 = company_2.jobs.create!(title: "Engineer", level_of_interest: 40, city: "Longmont", salary: 75000)
      job_3 = company_3.jobs.create!(title: "QA", level_of_interest: 75, city: "Loveland", salary: 80000)

      job.tags << tag
      job_2.tags << tag
      job_3.tags << tag

      # tag.jobs << [job, job_2, job_3]

      expect(tag.average_salary).to eq 75000
    end
  end
end
