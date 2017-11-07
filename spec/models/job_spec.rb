require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, city: "Denver", salary: 10)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", city: "Denver", salary: 10)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", level_of_interest: 80, salary: 10)
        expect(job).to be_invalid
      end

      it "is invalid without a salary" do
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, city, and salary" do
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", salary: 10)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, city: "Denver", salary: 10)
      expect(job).to respond_to(:company)
    end
  end

  describe "relationships" do
    it "has many tags" do
      job = Job.new(title: "Software", level_of_interest: 70, city: "Denver", salary: 10)
      expect(job).to respond_to(:tags)
    end
  end
end
