require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        tag = Tag.new(title: "Tech")
        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(title: "Tech")
      expect(tag).to respond_to(:jobs)
    end
  end

  describe "average method" do
    it "can find the average salary of jobs belonging to it" do
      tag = Tag.create(title: "Tech")
      tag.jobs.create(title: "Software", level_of_interest: 70, city: "Denver", salary: 100)
      tag.jobs.create(title: "Software", level_of_interest: 70, city: "Denver", salary: 200)

      expect(tag.average).to eq(150)
    end
  end
end
