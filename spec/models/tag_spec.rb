require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without text" do
        tag = Tag.new()
        expect(tag).to be_invalid
      end

      it "is invalid without a job" do
        tag = Tag.new(text: 'coolio')
        expect(tag).to be_invalid
      end
      it "a unique tag can only belong to a single job and a job can have multiple tags." do
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
        tag = Tag.create(text: 'coolio', job: job)
        tag2 = Tag.create(text: 'coolios', job: job)
        tag3 = Tag.new(text: 'coolio', job: job)

        expect(tag).to be_valid
        expect(tag2).to be_valid
        expect(tag3).to be_invalid
      end
    end

  end

  describe "relationships" do
    it "belongs to a job" do
      tag = Tag.new(text: 'coolio')
      expect(tag).to respond_to(:job)
    end
  end

  describe "instance methods" do
    it "can return a count of jobs with that tag" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      job2 = company.jobs.create!(title: "Fortran Developer", level_of_interest: 70, city: "Denver")
      tag = Tag.create(text: 'coolio', job: job)
      tag2 = Tag.create(text: 'coolio', job: job2)

      expect(tag.count_of_jobs_with_tag).to eq(2)
    end
    it "can return an average salary for jobs with that tag" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 10000)
      job2 = company.jobs.create!(title: "Fortran Developer", level_of_interest: 70, city: "Denver", salary: 12000)
      tag = Tag.create(text: 'coolio', job: job)
      tag2 = Tag.create(text: 'coolio', job: job2)

      expect(tag.average_salary_for_jobs_with_tag).to eq(11000)    
    end
  end
end
