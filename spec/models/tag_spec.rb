require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
      it "is invalid if name already exists" do
        Tag.create(name: "Service")
        tag_2 = Tag.create(name: "Service")
        expect(tag_2).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(name: "Service")
      expect(tag).to respond_to(:jobs)
    end
  end

  describe ".count" do
    it "returns job count" do
      two_jobs

      expect(@tag.count).to eq(2)
    end
  end

  describe ".average_salary" do
    it "returns average salary" do
      two_jobs

      expect(@tag.average_salary).to eq(13500)
    end
  end
end
