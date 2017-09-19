require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "can count jobs" do
  tag = Tag.create(name: "Tech")
  tag.jobs.create(title: "Teacher", level_of_interest: 70, city: "Denver")

  expect(tag.job_count).to eq(1)
  end
  it "can avaerage salaries" do
  tag = Tag.create(name: "Tech")
  tag.jobs.create(title: "Teacher", level_of_interest: 70, city: "Denver", salary: 100000)
  job1 = Job.create(title: "Admin", level_of_interest: 70, city: "Denver", salary: 50000)
  job1.tags << tag

  expect(tag.avg_salary).to eq(75000)
  end
end

