require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        tag = Tag.new(name: nil)
        expect(tag).to be_invalid
      end

      it "is invalid with duplicate name" do
        tag1 = Tag.create!(name: "tag name")
        tag2 = Tag.new(name: "tag name")
        expect(tag2).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many jobs through job tags" do
      tag = Tag.new(name: "Software")
      job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver")
      job_tag = JobTag.new(tag: tag, job: job)
      expect(tag).to respond_to(:jobs)
    end
  end
end
