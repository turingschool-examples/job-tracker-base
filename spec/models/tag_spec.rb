require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "invalid attributes" do
    it "is invalid without a title" do
      tag = Tag.new()
      expect(tag).to be_invalid
    end
  end

  context "valid attributes" do
    it "is valid with a title" do
      tag = Tag.new(title: "Software")
      expect(tag).to be_valid
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.create(title: "Software")

      job = tag.jobs.create(title: "Developer", level_of_interest: 70, description: "Wahooo")

      expect(tag.jobs.first.title).to eq("Developer")
    end
  end
end
