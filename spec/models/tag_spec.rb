require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new()
        expect(tag).to be_invalid
      end

      it "has a unique name" do
        tag_1 = Tag.create(name: "Tag 1")
        tag_2 = Tag.new(name: "Tag 1")
        expect(tag_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        tag = Tag.new(name: "Tag")
        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(name: "Tag")
      expect(tag).to respond_to(:jobs)
    end
  end
end
