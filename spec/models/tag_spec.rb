require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    context "invalid attributes" do
      it "is valid with a name" do
        tag = Tag.new(name: "red")
        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(name: "red")
      expect(tag).to respond_to(:jobs)
    end
  end
end
