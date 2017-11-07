require 'rails_helper'

RSpec.describe JobTag, type: :model do
  describe "relationships" do
    it "belongs to a jobs" do
      job_tag = JobTag.new
      expect(job_tag).to respond_to(:job)
    end


      it "belongs to a tag " do
        job_tag = JobTag.new
        expect(job_tag).to respond_to(:tag)
      end
  end
end
