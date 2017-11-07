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
    it "has and belongs to many jobs" do
      tag = Tag.new(title: "Software")
      expect(tag).to respond_to(:jobs)
    end
  end

  describe "instance methods" do
    let(:company) { Company.create!(name: "ESPN") }
    let(:job1) { company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 80000) }
    let(:job2) { company.jobs.create!(title: "Technician", level_of_interest: 50, city: "Longmont", salary: 40000) }
    let(:tag1) { job1.tags.create!(title: "Software") }
    let(:tag2) { job1.tags.create!(title: "Far Away") }
    before { job2.tags << tag1 }

    it '#jobs_with_tag finds the number of jobs with a specific tag' do
      expect(tag1.jobs_with_tag).to eq(2)
      expect(tag2.jobs_with_tag).to eq(1)
    end

    it '#average_salary calculates the average salary of all jobs with a specific tag' do
      expect(tag1.average_salary).to eq(60000)
      expect(tag2.average_salary).to eq(80000)
    end
  end
end
