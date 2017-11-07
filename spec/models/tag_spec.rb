require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "relationships" do
    it "has many to a jobs" do
      tag = Tag.new(title: "Software")
      expect(tag).to respond_to(:jobs)
    end


      it "has many to a job_tags" do
        tag = Tag.new(title: "Software")
        expect(tag).to respond_to(:job_tags)
      end
  end
end
