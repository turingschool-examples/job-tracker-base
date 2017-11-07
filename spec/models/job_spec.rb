require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver")
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, city: "Denver", description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it "has many taggings" do
      job = Job.new(title: "Software", level_of_interest: 70, city: "Denver", description: "Wahooo")
      expect(job).to respond_to(:taggings)
    end

    it "has many tags" do
      job = Job.new(title: "Software", level_of_interest: 70, city: "Denver", description: "Wahooo")
      expect(job).to respond_to(:tags)
    end
  end

  describe "class methods" do
    it "#average salary returns the average salary for all jobs in the collection" do
      Job.create(title: "Software", level_of_interest: 70, description: "Wahooo", city: "Denver", salary: 50000)
      Job.create(title: "Stuff", level_of_interest: 50, description: "Boooo", city: "Atlanta", salary: 100000)
      jobs = Job.all

      expect(jobs.average_salary).to eq(75000)
    end
  end
end
