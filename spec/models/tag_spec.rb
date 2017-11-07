require 'rails_helper'

describe Tag do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.create()

        expect(tag).to be_invalid
      end
    end
    
    context "valid attributes" do
      it "is valid with a name"  do
        tag = Tag.create(name: "Good Location")

        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.create(name: "Good Location")
      expect(tag).to respond_to(:jobs)
    end
  end
end