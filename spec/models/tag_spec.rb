require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        tag = Tag.new()
        expect(tag).to be_invalid
      end

      it "has a unique title" do
        Tag.create(title: "Software")
        tag = Tag.new(title: "Software")
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        tag = Tag.new(title: "Software")
        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(title: "Software")
      expect(tag).to respond_to(:jobs)
    end
  end

  describe "instance methods" do
    it '#jobs_with_tag finds the number of jobs with a specific tag' do
      company = Company.create!(name: "ESPN")
      job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      job2 = company.jobs.create!(title: "Technician", level_of_interest: 50, city: "Longmont")
      tag1 = job1.tags.create!(title: "Software")
      tag2 = job1.tags.create!(title: "Far Away")
      job2.tags << tag1

      expect(tag1.jobs_with_tag).to eq(2)
      expect(tag2.jobs_with_tag).to eq(1)
    end

    it '#average_salary calculates the average salary of all jobs with a specific tag' do

    end
  end
end
