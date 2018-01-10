require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    describe "relationships" do
      it "belongs to job tags" do
        tag = Tag.new(name: "YEAHHHH")
        expect(tag).to respond_to(:job_tags)
      end
    end
  end

  describe "Instance Methods" do
    describe ".count_jobs" do
      it "returns total count for jobs" do
        job1 = Job.new(title: "Developer", level_of_interest: 40, description: "Wahooo", city: "SF")
        job2 = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", city: "SF")
        job3 = Job.new(title: "HR", level_of_interest: 50, description: "Wahooo", city: "SF")
        tag1 = Tag.new(name: "sportsball")
        JobTag.create!(job: job1, tag: tag1)
        JobTag.create!(job: job2, tag: tag1)
        JobTag.create!(job: job3, tag: tag1)

        expect(tag1.count_jobs).to eq(3)
      end
    end
    describe ".average_salary" do
      it "returns average salary for jobs" do
        job1 = Job.new(title: "Developer", level_of_interest: 40, description: "Wahooo", city: "SF", salary: 50000)
        job2 = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", city: "SF", salary: 60000)
        job3 = Job.new(title: "HR", level_of_interest: 50, description: "Wahooo", city: "SF", salary: 70000)
        tag1 = Tag.new(name: "sportsball")
        JobTag.create!(job: job1, tag: tag1)
        JobTag.create!(job: job2, tag: tag1)
        JobTag.create!(job: job3, tag: tag1)

        expect(tag1.average_salary).to eq(0.6e5)
      end
    end

  end
end
