require 'rails_helper'

describe JobTag do
    describe "relationships" do
      it "belongs to tag" do
        tag = Tag.new(name: "cool")
        jobtag = JobTag.new(tag: tag)
        expect(jobtag).to respond_to(:tag)
      end
    end

    describe "relationships" do
      it "belongs to job" do
        job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
        jobtag = JobTag.new(job: job)
        expect(jobtag).to respond_to(:job)
      end
    end
end
