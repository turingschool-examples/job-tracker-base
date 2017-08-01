require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        tag = Tag.new(name: "Interesting")
        expect(tag).to be_valid
      end
    end
  end

end
