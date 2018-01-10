require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    describe "relationships" do
      it "belongs to job tags" do
        tag = Tag.new(name: "YEAHHHH")
        expect(tag).to respond_to(:job_tags)
      end
    end
  end
end
