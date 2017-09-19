require 'rails_helper'

RSpec.describe JobTag, type: :model do
  describe "relationships" do
    it "belongs to a tag" do

      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      tag = Tag.new(name: "Development")
      expect(tag).to respond_to(:job)
      exepect(tag). to respond_to()
    end
  end
end
