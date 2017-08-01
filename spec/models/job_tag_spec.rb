require 'rails_helper'

RSpec.describe JobTag, type: :model do
  describe "#tag_count" do
    it "shows jobs with tag" do
      job     = Job.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 1500)
      job_two = Job.create!(title: "Project Manager", level_of_interest: 80, city: "Denver", salary: 2100)
      tag_one = job.tags.create(name: "New")
      tag_two = job.tags.create(name: "Old")
      job_two = job_two.tags << tag_two
      expecter = JobTag.tag_count(tag_two)

      expect(expecter).to eq 2
    end
  end
end
