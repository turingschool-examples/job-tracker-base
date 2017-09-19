require 'rails_helper'

describe "relationships" do
  it "belongs to a job " do
    job = Job.new(title: "Developer", level_of_interest: 70, description: "Wahooo")
    job_tag = JobTag.new(job_id:job.id, tag_id:tag.id)

    expect(job_tag).to respond_to(:job)
  end
  it "belongs to a tag" do
      tag = Tag.new(title: "Software")

      expect(job_tag).to respond_to(:tag)
  end
end
