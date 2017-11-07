require 'rails_helper'

describe Tag do

  describe "Instance Methods" do

    before(:each) do
      @company = Company.create!(name: "ESPN")
      @job_1 = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      @tag_1 = @job_1.tags.create(name: "Sports")
      @tag_2 = @job_1.tags.create(name: "Entry Level")

      @job_2 = @tag_1.jobs.create(title: "Product Manager", level_of_interest: 10, city: "Denver", company: @company, salary: 150000)
      @job_3 = @tag_1.jobs.create(title: "Code Monkey", level_of_interest: 99, city: "Denver", company: @company, salary: 50000)

      @job_4 = @tag_2.jobs.create(title: "Code Monkey", level_of_interest: 95, city: "Seattle", company: @company)
      @job_5 = @tag_2.jobs.create(title: "Junior Developer", level_of_interest: 90, city: "Seattle", company: @company)
      @job_6 = @tag_2.jobs.create(title: "Director", level_of_interest: 85, city: "Seattle", company: @company)
    end

    describe "#job_count" do
      it "returns the number of jobs associated with a tag" do
        expected = 3
        actual = @tag_1.job_count

        expect(actual).to eq(expected)
      end
    end

    describe "#avg_salary" do
      it "returns the average salary associated with a job (disregarding jobs without a salary listed)" do
        expected = 100000
        actual = @tag_1.avg_salary

        expect(actual).to eq(expected)
      end
    end

  end

end
