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
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end

  describe "#average_salary" do
    it "shows average salary" do
      job     = Job.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 1500)
      job_two = Job.create!(title: "Project Manager", level_of_interest: 80, city: "Denver", salary: 2100)
      tag_one = job.tags.create(name: "New")
      tag_two = job.tags.create(name: "Old")
      job_two = job_two.tags << tag_two
      expected = Job.average_salary(tag_two)

      expect(expected).to eq 1800
    end
  end
end
