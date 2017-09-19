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
end
