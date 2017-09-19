require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without text" do
        tag = Tag.new()
        expect(tag).to be_invalid
      end

      it "is invalid without a job" do
        tag = Tag.new(text: 'coolio')
        expect(tag).to be_invalid
      end
    end

  end

  describe "relationships" do
    it "belongs to a job" do
      tag = Tag.new(text: 'coolio')
      expect(tag).to respond_to(:job)
    end
  end
end
