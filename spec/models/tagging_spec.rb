require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe "relationships" do
    
    it "belongs to a tag" do
      job = Job.new(title: "Software", level_of_interest: 70, city: "Denver", description: "Wahooo")
      tag = Tag.new(name: "Tech")
      tagging = Tagging.new(job: job, tag: tag)

      expect(tagging).to respond_to(:tag)
    end

    it "belongs to a job" do
      job = Job.new(title: "Software", level_of_interest: 70, city: "Denver", description: "Wahooo")
      tag = Tag.new(name: "Tech")
      tagging = Tagging.new(job: job, tag: tag)

      expect(tagging).to respond_to(:job)
    end

  end
end
