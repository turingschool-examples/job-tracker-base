require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "Validations" do
    it "is valid with valid attributes" do
      tag = Tag.create(name: "last chance")

      expect(tag).to be_valid
    end
    it "is invalid with invalid attributes" do
      tag = Tag.create

      expect(tag).to_not be_valid
    end
  end
  context "Associations" do
    it "can have many jobs" do
      tag = Tag.create(name: "last chance")
    expect(tag).to respond_to(:jobs)
    end
  end
end
