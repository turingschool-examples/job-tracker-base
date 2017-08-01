require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "relationships" do
    it "has many taggings" do
      tag = Tag.new(name: "Software")
      expect(tag).to respond_to(:taggings)
    end
    it "has many jobs" do
      tag = Tag.new(name: "Software")
      expect(tag).to respond_to(:jobs)
    end
  end

  describe "instance methods" do
    before :each do
      company = Company.create!(name: "ESPN")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 30)
      job_2 = company.jobs.create!(title: "Developer 2", level_of_interest: 70, city: "Denver", salary: 40)
      job_3 = company.jobs.create!(title: "Manager", level_of_interest: 70, city: "Denver", salary: 50)

      @engineering = Tag.create!(name: "engineering")
      @tech = Tag.create!(name: "tech")

      @engineering.jobs << [job_1, job_2]
      @tech.jobs << [job_1, job_2, job_3]
    end

    it ".average_salary returns average salary of all associated jobs" do
      expect(@engineering.average_salary).to eq(35)
      expect(@tech.average_salary).to eq(40)
    end
    it ".job_count returns count of all associated jobs" do
      expect(@engineering.job_count).to eq(2)
      expect(@tech.job_count).to eq(3)
    end
  end
end
