require 'rails_helper'

describe Tag do
  describe "validations" do
    it "is invalid without a title" do
      tag = Tag.new()
      expect(tag).to be_invalid
    end
    it "is valid with a title " do
      tag1 = Tag.new(title: "Unicorn catcher")
      expect(tag1).to be_valid
    end
  end
  describe "relationships" do
    it "has many job_tags" do
      tag = Tag.new(title: "Software")
      expect(tag).to respond_to(:job_tags)
    end
  end
end
