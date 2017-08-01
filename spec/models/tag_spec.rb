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
        tag = Tag.new(name: "Education")
        expect(tag).to be_valid
      end

      it "is invalid with a name that exists" do
        tag = Tag.create(name: "Education")
        tag1 = Tag.new(name: "Education")
        expect(tag1).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(name: "Education")
      expect(tag).to respond_to(:jobs)
    end
  end
end
