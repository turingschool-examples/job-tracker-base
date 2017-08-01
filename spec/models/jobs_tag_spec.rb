require 'rails_helper'

RSpec.describe JobsTag, type: :model do
  describe "relationships" do
    it "belongs to jobs" do
      jobs_tag = JobsTag.new
      expect(jobs_tag).to respond_to(:job)
    end

    it "belongs to tags" do
      jobs_tag = JobsTag.new
      expect(jobs_tag).to respond_to(:tag)
    end
  end
end
