require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        tag = Tag.new(name: "Technology")
        expect(tag).to be_valid
      end
    end

    describe "associations" do
      it "has many jobs" do
        tag = Tag.new(name: "Technology")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver")

        tag.jobs << job

        expect(tag.jobs).to include(job)
        expect(tag).to respond_to(:jobs)
      end
    end
  end
end
