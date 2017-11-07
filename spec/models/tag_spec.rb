require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "relationships" do

    it "has many taggings" do
      tag = Tag.new(name: "tech")
      expect(tag).to respond_to(:taggings)
    end

    it "has many jobs" do
      tag = Tag.new(name: "tech")
      expect(tag).to respond_to(:jobs)
    end
    
  end
end
